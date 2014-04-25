<!-- BEGIN: main -->
<script src="{NV_BASE_SITEURL}themes/{NV_ADMIN_THEME}/js/colpick.js"></script>
<link rel="stylesheet" href="{NV_BASE_SITEURL}themes/{NV_ADMIN_THEME}/js/colpick.css">

<div class="config_theme">
<form action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
	<table class="tab1" style="width: 100%">
	    <caption>{LANG.config_general}</caption>
		<tfoot>
			<tr>
				<td colspan="2" class="center"><input name="submit" type="submit" value="{LANG.save}" /></td>
			</tr>
		</tfoot>
		<tbody>
			<tr>
				<td width="150"><strong>{LANG.config_allpages}</strong></td>
                <td>
                    <label>{LANG.color}</label>
                    <input type="text" value="{CONFIG_THEME_BODY.color}" name="body_color" id="picker_body_color" style="width: 80px" /><br />
                    
                    <label>{LANG.font_size}</label>
                    <input type="text" value="{CONFIG_THEME_BODY.font_size}" name="body_font_size" style="width: 80px" /><br />
                    
                    <label>{LANG.font_family}</label>
                    <input type="text" value="{CONFIG_THEME_BODY.font_family}" name="body_font_family" style="width: 300px" /><br />
                    
                    <label>{LANG.font_style}</label>
                    <input type="checkbox" name="body_font_weight" {CONFIG_THEME_BODY.font_weight} /><strong>{LANG.font_style_bold}</strong>
                    <input type="checkbox" name="body_font_italic" {CONFIG_THEME_BODY.font_style} /><em>{LANG.font_style_italic}</em><br />
                    
                    <label>{LANG.background}</label>
                    <input type="text" value="{CONFIG_THEME_BODY.background_color}" name="body_background_color" id="picker_body_background" style="width: 80px" />
                    <input type="text" id="body_bg_image" value="{CONFIG_THEME_BODY.background_image}" name="body_background_image" placeholder="{LANG.background_imgage}" style="width: 201px" />
                    <button onclick="nv_open_filemanage( 'body_bg_image' )"><em class="icon-folder-open">&nbsp;</em></button>
                    <input type="text" value="{CONFIG_THEME_BODY.background_repeat}" name="body_background_repeat" style="width: 80px" placeholder="{LANG.background_imgage_repeat}" />
                    <input type="text" value="{CONFIG_THEME_BODY.background_position}" name="body_background_position" style="width: 80px" placeholder="{LANG.background_imgage_postion}" />
                    <br />
                    
                    <label>{LANG.margin}</label>
                    <input type="text" name="body_margin" value="{CONFIG_THEME_BODY.margin}" placeholder="{LANG.margin_all}" style="width: 80px" />
                    <input type="text" name="body_margin_top" value="{CONFIG_THEME_BODY.margin_top}" placeholder="{LANG.margin_top}" style="width: 80px" />
                    <input type="text" name="body_margin_bottom" value="{CONFIG_THEME_BODY.margin_bottom}" placeholder="{LANG.margin_bottom}" style="width: 80px" />
                    <input type="text" name="body_margin_left" value="{CONFIG_THEME_BODY.margin_left}" placeholder="{LANG.margin_left}" style="width: 80px" />
                    <input type="text" name="body_margin_right" value="{CONFIG_THEME_BODY.margin_right}" placeholder="{LANG.margin_right}" style="width: 80px" />
                    <br />
                    
                    <label>{LANG.padding}</label>
                    <input type="text" name="body_padding" value="{CONFIG_THEME_BODY.padding}" placeholder="{LANG.padding_all}" style="width: 80px" />
                    <input type="text" name="body_padding_top" value="{CONFIG_THEME_BODY.padding_top}" placeholder="{LANG.padding_top}" style="width: 80px" />
                    <input type="text" name="body_padding_bottom" value="{CONFIG_THEME_BODY.padding_bottom}" placeholder="{LANG.padding_bottom}" style="width: 80px" />
                    <input type="text" name="body_padding_left" value="{CONFIG_THEME_BODY.padding_left}" placeholder="{LANG.padding_left}" style="width: 80px" />
                    <input type="text" name="body_padding_right" value="{CONFIG_THEME_BODY.padding_right}" placeholder="{LANG.padding_right}" style="width: 80px" />
                    <br />
                    
                    <label>{LANG.link}</label>
                    <input type="text" value="{CONFIG_THEME_A_LINK.color}" name="link_a_color" id="picker_link_color" style="width: 80px" placeholder="{LANG.color}" />
                    <input type="checkbox" name="link_a_font_weight" {CONFIG_THEME_A_LINK.font_weight} /><strong>{LANG.font_style_bold}</strong>
                    <input type="checkbox" name="link_a_font_italic" {CONFIG_THEME_A_LINK.font_style} /><em>{LANG.font_style_italic}</em>
                    <br />
                    
                    <label>{LANG.link} (hover)</label>
                    <input type="text" value="{CONFIG_THEME_A_LINK_HOVER.color}" name="link_a_hover_color" id="picker_link_hover_color" style="width: 80px" placeholder="{LANG.color}" />
                    <input type="checkbox" name="link_a_hover_font_weight" {CONFIG_THEME_A_LINK_HOVER.font_weight} /><strong>{LANG.font_style_bold}</strong>
                    <input type="checkbox" name="link_a_hover_font_italic" {CONFIG_THEME_A_LINK_HOVER.font_style} /><em>{LANG.font_style_italic}</em>
                    <br />
                    
                    <label>{LANG.customcss}</label>
                    <textarea name="body_customcss" style="width: 300px; height: 50px">{CONFIG_THEME_BODY.customcss}</textarea><br />
                </td>
			</tr>
			<tr>
			    <td><strong>{LANG.config_content}</strong></td>
			    <td>
                    <label>{LANG.margin}</label>
                    <input type="text" name="content_margin" value="{CONFIG_THEME_CONTENT.margin}" placeholder="{LANG.margin_all}" style="width: 80px" />
                    <input type="text" name="content_margin_top" value="{CONFIG_THEME_CONTENT.margin_top}" placeholder="{LANG.margin_top}" style="width: 80px" />
                    <input type="text" name="content_margin_bottom" value="{CONFIG_THEME_CONTENT.margin_bottom}" placeholder="{LANG.margin_bottom}" style="width: 80px" />
                    <input type="text" name="content_margin_left" value="{CONFIG_THEME_CONTENT.margin_left}" placeholder="{LANG.margin_left}" style="width: 80px" />
                    <input type="text" name="content_margin_right" value="{CONFIG_THEME_CONTENT.margin_right}" placeholder="{LANG.margin_right}" style="width: 80px" />
                    <br />
                    
                    <label>{LANG.padding}</label>
                    <input type="text" name="content_padding" value="{CONFIG_THEME_CONTENT.padding}" placeholder="{LANG.padding_all}" style="width: 80px" />
                    <input type="text" name="content_padding_top" value="{CONFIG_THEME_CONTENT.padding_top}" placeholder="{LANG.padding_top}" style="width: 80px" />
                    <input type="text" name="content_padding_bottom" value="{CONFIG_THEME_CONTENT.padding_bottom}" placeholder="{LANG.padding_bottom}" style="width: 80px" />
                    <input type="text" name="content_padding_left" value="{CONFIG_THEME_CONTENT.padding_left}" placeholder="{LANG.padding_left}" style="width: 80px" />
                    <input type="text" name="content_padding_right" value="{CONFIG_THEME_CONTENT.padding_right}" placeholder="{LANG.padding_right}" style="width: 80px" />
                    <br />
                    
                    <label>{LANG.size}</label>
                    <input type="text" name="content_width" value="{CONFIG_THEME_CONTENT.width}" placeholder="{LANG.size_width}" style="width: 80px" />
                    <input type="text" name="content_height" value="{CONFIG_THEME_CONTENT.height}" placeholder="{LANG.size_height}" style="width: 80px" />
                    <br />
                    
                    <label>{LANG.customcss}</label>
                    <textarea name="content_customcss" style="width: 300px; height: 50px">{CONFIG_THEME_CONTENT.customcss}</textarea><br />
			    </td>
			</tr>
		</tbody>
	</table>
</form>
</div>

<script type="text/javascript">
//<![CDATA[
    $(document).ready(function() {
        $('#picker_body_color').css({'background-color' : $('#picker_body_color').val()});
        $('#picker_body_background').css({'background-color' : $('#picker_body_background').val()});
        $('#picker_content_background').css({'background-color' : $('#picker_content_background').val()});
        $('#picker_link_color').css({'background-color' : $('#picker_link_color').val()});
        $('#picker_link_hover_color').css({'background-color' : $('#picker_link_hover_color').val()});     
    });
    
    $('#picker_body_color, #picker_body_background, #picker_content_background, #picker_link_color, #picker_link_hover_color').colpick({
        layout:'hex',
        submit:0,
        colorScheme:'dark',
        onChange:function(hsb,hex,rgb,el,bySetColor) {
            $(el).css('background-color','#'+hex);
            if(!bySetColor) $(el).val('#' + hex);
        }
    }).keyup(function(){
        $(this).colpickSetColor(this.value);
    });
    
    function nv_open_filemanage( area )
    {
        var alt = "backgroundimgalt";
        var path = "{UPLOADS_DIR}";
        var type = "image";
        nv_open_browse_file(script_name + "?" + nv_name_variable + "=upload&popup=1&area=" + area + "&alt=" + alt + "&path=" + path + "&type=" + type, "NVImg", 850, 420, "resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
        return false;
    }
//]]>
</script>
<!-- END:main -->