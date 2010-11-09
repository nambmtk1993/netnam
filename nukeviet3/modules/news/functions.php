<?php

/**
 * @Project NUKEVIET 3.0
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @copyright 2009
 * @createdate 12/31/2009 0:51
 */
if ( ! defined( 'NV_SYSTEM' ) ) die( 'Stop!!!' );
if ( ! in_array( $op, array( 
    'viewcat', 'detail' 
) ) )
{
    define( 'NV_IS_MOD_NEWS', true );
}
require_once ( NV_ROOTDIR . "/modules/" . $module_file . "/global.functions.php" );

global $global_array_cat;
$global_array_cat = array();
$link_i = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module_name . "&amp;" . NV_OP_VARIABLE . "=Other";
$global_array_cat[0] = array( 
    "catid" => 0, "parentid" => 0, "title" => "Other", "alias" => "Other", "link" => $link_i, "viewcat" => "viewcat_page_new", "subcatid" => 0, "numlinks" => 3, "description" => "", "inhome" => 0, "keywords" => "" 
);

$catid = 0;
$parentid = 0;
$set_viewcat = "";
$alias_cat_url = isset( $array_op[0] ) ? $array_op[0] : "";
$array_mod_title = array();
$sql = "SELECT catid, parentid, title, alias, viewcat, subcatid, numlinks, del_cache_time, description, inhome, keywords, who_view, groups_view FROM `" . NV_PREFIXLANG . "_" . $module_data . "_cat` ORDER BY `order` ASC";
$result = $db->sql_query( $sql );
while ( list( $catid_i, $parentid_i, $title_i, $alias_i, $viewcat_i, $subcatid_i, $numlinks_i, $del_cache_time_i, $description_i, $inhome_i, $keywords_i, $who_view_i, $groups_view_i ) = $db->sql_fetchrow( $result ) )
{
    $link_i = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module_name . "&amp;" . NV_OP_VARIABLE . "=" . $alias_i;
    $global_array_cat[$catid_i] = array( 
        "catid" => $catid_i, "parentid" => $parentid_i, "title" => $title_i, "alias" => $alias_i, "link" => $link_i, "viewcat" => $viewcat_i, "subcatid" => $subcatid_i, "numlinks" => $numlinks_i, "description" => $description_i, "inhome" => $inhome_i, "keywords" => $keywords_i, "who_view" => $who_view_i, "groups_view" => $groups_view_i 
    );
    if ( $alias_cat_url == $alias_i )
    {
        $catid = $catid_i;
        $parentid = $parentid_i;
    }
    if ( NV_CURRENTTIME > $del_cache_time_i )
    {
        $sql = "SELECT `id`, `listcatid`, `exptime`, `archive` FROM `" . NV_PREFIXLANG . "_" . $module_data . "_" . $catid_i . "` WHERE `exptime` > 0 AND `exptime` <= UNIX_TIMESTAMP() AND `archive`!='2' ORDER BY `exptime` ASC LIMIT 0 , 1";
        list( $id, $listcatid, $minexptime, $archive ) = $db->sql_fetchrow( $db->sql_query( $sql ) );
        if ( intval( $id ) > 0 )
        {
            if ( intval( $archive ) == 0 )
            {
                nv_del_content_module( $id );
            }
            else
            {
                nv_archive_content_module( $id, $listcatid );
            }
            nv_del_moduleCache( $module_name );
        }
        list( $minpubltime ) = $db->sql_fetchrow( $db->sql_query( "SELECT min(publtime) FROM `" . NV_PREFIXLANG . "_" . $module_data . "_" . $catid_i . "` WHERE `publtime` > UNIX_TIMESTAMP()" ) );
        $minpubltime = ( empty( $minpubltime ) ) ? NV_CURRENTTIME + 26000000 : intval( $minpubltime );
        
        list( $id, $listcatid, $minexptime, $archive ) = $db->sql_fetchrow( $db->sql_query( $sql ) );
        $minexptime = ( empty( $minexptime ) ) ? NV_CURRENTTIME + 26000000 : intval( $minexptime );
        $del_cache_time = min( $minpubltime, $minexptime );
        $db->sql_query( "UPDATE `" . NV_PREFIXLANG . "_" . $module_data . "_cat` SET `del_cache_time`=" . $db->dbescape( $del_cache_time ) . " WHERE `catid`=" . $catid_i . "" );
    }
}

foreach ( $global_array_cat as $catid_i => $array_cat_i )
{
    if ( $catid_i > 0 and $array_cat_i['parentid'] == 0 )
    {
        $act = 0;
        $submenu = array();
        if ( $catid_i == $catid or $catid_i == $parentid )
        {
            $act = 1;
            if ( ! empty( $global_array_cat[$catid_i]['subcatid'] ) )
            {
                $array_catid = explode( ",", $global_array_cat[$catid_i]['subcatid'] );
                foreach ( $array_catid as $sub_catid_i )
                {
                    $array_sub_cat_i = $global_array_cat[$sub_catid_i];
                    $sub_act = 0;
                    if ( $sub_catid_i == $catid )
                    {
                        $sub_act = 1;
                    }
                    $submenu[] = array( 
                        $array_sub_cat_i['title'], $array_sub_cat_i['link'], $sub_act 
                    );
                }
            }
        
        }
        $nv_vertical_menu[] = array( 
            $array_cat_i['title'], $array_cat_i['link'], $act, 'submenu' => $submenu 
        );
    }
    
    //Xac dinh RSS
    if ( $catid_i )
    {
        $rss[] = array(  //
            'title' => $module_info['custom_title'] . ' - ' . $array_cat_i['title'], //
'src' => NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module_name . "&amp;" . NV_OP_VARIABLE . "=rss/" . $array_cat_i['alias']  //
        );
    }
}
unset( $result, $catid_i, $parentid_i, $title_i, $alias_i );

$module_info['submenu'] = 0;

$page = 0;
$per_page_comment = 5;
$per_page = $module_config[$module_name]['per_page'];
$st_links = $module_config[$module_name]['st_links'];
$count_op = count( $array_op );
if ( ! empty( $array_op ) and $op == "main" )
{
    if ( ! empty( $alias_cat_url ) and $catid == 0 )
    {
        $redirect = "<META HTTP-EQUIV=\"refresh\" content=\"3;URL=" . $global_config['site_url'] . "/index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module_name . "\" />";
        nv_info_die( $lang_global['error_404_title'], $lang_global['error_404_title'], $lang_global['error_404_content'] . $redirect );
    }
    elseif ( $catid == 0 )
    {
        $contents = $lang_module['nocatpage'] . $array_op[0];
        if ( isset( $array_op[1] ) and substr( $array_op[1], 0, 5 ) == "page-" )
        
        {
            $page = intval( substr( $array_op[1], 5 ) );
        }
    }
    else
    {
        $op = "main";
        if ( $count_op == 1 or substr( $array_op[1], 0, 5 ) == "page-" )
        {
            $op = "viewcat";
            if ( $count_op > 1 )
            {
                $set_viewcat = "viewcat_page_new";
                $page = intval( substr( $array_op[1], 5 ) );
            }
        }
        elseif ( $count_op == 2 )
        {
            $array_page = explode( "-", $array_op[1] );
            $id = intval( end( $array_page ) );
            $number = strlen( $id ) + 1;
            $alias_url = substr( $array_op[1], 0, - $number );
            if ( $id > 0 and $alias_url != "" )
            {
                $op = "detail";
            }
        }
        $parentid = $catid;
        while ( $parentid > 0 )
        {
            $array_cat_i = $global_array_cat[$parentid];
            $array_mod_title[] = array( 
                'catid' => $parentid, 'title' => $array_cat_i['title'], 'link' => $array_cat_i['link'] 
            );
            $parentid = $array_cat_i['parentid'];
        }
        sort( $array_mod_title, SORT_NUMERIC );
    }
}

?>