tcl86t.dll      tk86t.dll       tk                .   �  �  	   �   Htk\ttk\utils.tcl tk\ttk\fonts.tcl tk\tk.tcl tk\ttk\ttk.tcl tcl86t.dll tk\license.terms tk\text.tcl tk86t.dll VCRUNTIME140.dll zlib1.dll tk\ttk\cursors.tcl proc _ipc_server {channel clientaddr clientport} {
set client_name [format <%s:%d> $clientaddr $clientport]
chan configure $channel \
-buffering none \
-encoding utf-8 \
-eofchar \x04 \
-translation cr
chan event $channel readable [list _ipc_caller $channel $client_name]
}
proc _ipc_caller {channel client_name} {
chan gets $channel cmd
if {[chan eof $channel]} {
chan close $channel
exit
} elseif {![chan blocked $channel]} {
if {[string match "update_text*" $cmd]} {
global status_text
set first [expr {[string first "(" $cmd] + 1}]
set last [expr {[string last ")" $cmd] - 1}]
set status_text [string range $cmd $first $last]
}
}
}
set server_socket [socket -server _ipc_server -myaddr localhost 0]
set server_port [fconfigure $server_socket -sockname]
set env(_PYIBoot_SPLASH) [lindex $server_port 2]
image create photo splash_image
splash_image put $_image_data
unset _image_data
proc canvas_text_update {canvas tag _var - -} {
upvar $_var var
$canvas itemconfigure $tag -text $var
}
package require Tk
set image_width [image width splash_image]
set image_height [image height splash_image]
set display_width [winfo screenwidth .]
set display_height [winfo screenheight .]
set x_position [expr {int(0.5*($display_width - $image_width))}]
set y_position [expr {int(0.5*($display_height - $image_height))}]
frame .root
canvas .root.canvas \
-width $image_width \
-height $image_height \
-borderwidth 0 \
-highlightthickness 0
.root.canvas create image \
[expr {$image_width / 2}] \
[expr {$image_height / 2}] \
-image splash_image
font create myFont {*}[font actual TkDefaultFont]
font configure myFont -size -15
.root.canvas create text \
78 \
290 \
-fill black \
-justify center \
-font myFont \
-tag vartext \
-anchor sw
trace variable status_text w \
[list canvas_text_update .root.canvas vartext]
set status_text "Initializing"
wm attributes . -transparentcolor magenta
.root.canvas configure -background magenta
pack .root
grid .root.canvas -column 0 -row 0 -columnspan 1 -rowspan 2
wm overrideredirect . 1
wm geometry . +${x_position}+${y_position}
wm attributes . -topmost 1
raise .�PNG

   IHDR  �  ,   �4$�   	pHYs     ��  �IDATx���[l�ׁ���	E��HI�n�hY�$W��ʷ��I��$i]#����<t0ۇ]t:/��/������̢���h�ޢn���MƊ�ږeE�Xw��%J�%R/b��p���y�Cɖ���(x������~:�������  ��� ��F��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �bz�7 <NV��]i��#�n��B����Dr�o;1���q�����.�~b��L�G1��<������s�vki8�ٕ����'!��L��x��ư�P�ߋ�NǹS�V��G�T[㩶��Nn��o�9m��Ta��>���}������'���cA��-���e�}�n���x�'�D2)�0�L[����j����-����W��f������+�8��޲�W���RkI�6|�6��_���B��d�J��[�5g�<�5E��O��鉃9���v"�8�&;��l:{�]1X�i�[Z��#%�lC�cKmթ�F���Q�^��M���Js�S>V�g���6!D"�_��ٶ�R[%k�R"��1>��`�٤nIQZ��Gc��4�38ˬn���t�jk����E����/�[C��G����:�S��%�����ϼq����%���z<��l|+�!�&�+]���f,{&�ɟ_�3濟�`c->�L��>����M�ѝav)|mdZ>v�m����zGS9���δy^?�e6=r�vkisM����&�0�7���>Cy�j6��cs�3wSfn�5n�C=�<0�{������#�x��".�}ڃ�'�1zF�VK��V>�nr�s}80^�d��v��/Gt.�Y^�j5�"��N�}�2�3����٭��+�����-ƚ{���&�
��g5��������j6u�kN�o6�����C|{��C�SK��������������Ƿ��Obt'�xgT���n-={���|0��l*�����V�(76�{���'��6��f��G�|6�y�ˑ���T��_k�f����P�b"�쟙o�����YJL5�rc����N662�T����)El#y��	c4cw#Fw��wFKK��h�s�-i���Os��Y�lVK���rxf���=��F��񦧏6���6��\ c�q�b>(���]߽6�-�[j�T�/��827��r�٭��M&�٘M&ch�{H�H&C�B���Jl-[{B�6`+�;�{����:3�>˚����&���BT;�r��R����Z�ZB�/G���|�JP_0�R������Cޞ�n;w���k�4�}80^p������F8G�2
�#�#Qc�/*-yJ~�d���Dl-����x2�;O4�|������13�%����|�K
G����Zry5�o}��1@���;��K���Gg6<7��N�T��e�����?3�r�����7�+�Vϴy�u�d�O�?�����wKm�:^�m��R����>�btG�&���~�K>U��/�������!U��%��A�|Q��A��h|�;�;5��rb�Ԝ�-��$��I�٤��p�_'�φJ��k�˫q9��>����G��\@��{����WmU|~bW'�� Fw*9J������Y0���Oϴy��*C�1Y*��R��5����Ӎ��͖��y�z��DIc�4e����և=B�d��ҟ�l�������	���.<��NƢL�w޿~�Sk6��uyٹ'}:3��r�m�J;��=���zF����� ��ȣ���3�ԑ�:����'�Y8�X�R�tU!DKmUw�[��.���ժ~ҏ�F�1>{v=e���\P�H$�n/50���F��>�6�y��Ζ�d�(���R*�vk����B��:�?���k�����a4��+��cδy�؆�'nN�3�;���e,z�Ӂe�f�)��9>���;�Fbt���nx���=T�ϗVcy.`\ ��r���(��VcjD�w��v�mr�S���J�Ss�Iwv)���DaǛ�V-�*z��1�SsB�{��N$3t�}�t7���8�B��RzG��Z�-Gc*S��Ŕ����8@��Sg��v:�;{'|�Ss���v:�%��C_��/R��և��n�c��"�IǛ�~��Y>Ζ�B�621�4�!��,����ܟ�=�݅rw4�r���V���q��ג���Q�6��Yƨ��7�LG��SˁpD&i��:c����*�G�������y4T���@C������q�B�����_���+�,�%O�wU�P�1`�1�sɔ\�d �OGS�p}5�\i�s��2�3�l=�M)cT�<K��G�d�@8"+�9|�������ȉ^�5Vj�Ԫv�f����R��{1�#�!�n���d2��q��;�^�=Ԩ�S�(�d�t������Ն ��/��k6�>��ح��o�٭��`��[�mX��1>[XJ��I~��)���<2
�#��eۈXo
��k�v1b�J��P`4����S��ɜJ)]ʡ���*��Cb��I&E�q��A.[��������"�p��Qe�|�L�GEm>�`c���\M@�G�uU �}�=P�O���S�a�:��hV��*�1h*��%mb�Z����������u�ţ
��h|1�V�X����_��En���wjθƨ��Vc���7��*l��6�L�B�p'�l�.z�p�(S����VE�M�G�����"��m��.��6歲Y�8�K�����;1�D�&��ޙ���M)�[���:�[���dr��Z\~�K�.��l2嘒$k�*��2I�j6�w���v:���/_�;��xO���1��#1� 56��:ʫ6���v:X�yO!Fw�|~e��
��Y���$K�jXRJ몑\c�����������f�酎�|�{���rn{8/�"��RZ�qЕH������=�$�^@��Zjrzs�Ӹ��f���q5&%�L�`m�s~��������8�L�s�ȿڊ��d�RM��=r)�������8%,��Z����V���o��\B�/G�
�}��MջSd,�y�W�
#����fM���<9x� ������ +�w�@<���=��<�uv��X��������U�f\)e�SƆQY�Οq�T���PaX	{~9r�ޥz�\v��\�$�{��Ĺ�/�\FcQ�o�'�@�f��W�����d2cۨ溥�dإSam�U�{��o)|�ީ.Ra��>����VJ�S�zW�Y*�J�U�b�e4n��?�cTqs��~WEs�s6P`� =#�ީ9�]����bhU�9ܝ�s���Ғ�47��E��	96��l�7�ڛTy퓻�˛����g�yΞ��M��'E�����ͨ	�V���*�l*����G��6r�G�g1�5ô��J���5W��x���_|ߤ��m�&�+%�%���ro�w�������[�m��x���]��/��ΐ��=E�^�t`Yv}af����·����W��Qd�nr�sɥ��V��a��9�6��{1�{�M$���?���ݹ�ֵ�����{�(3������R���g��G�6��@FrTa�vbt�P*�����Y�Pi��,o�w�Mnȑ���Fu%]�;�(��҉�٥���C�=���9����V�h,��}Y�8����L��]ɰ��s_j<q�Ad�����ZG���Y���p��q�b�Ǳ�.�v���Sh56X_���Ъ���X�z+�}��˫���~�f�/����|��q˶��`ƲR�I;�Vw��7�}IV����l��?Q��d�r�SsE\�%�ڃX�>:GY~��v

C��Hjx��L�h�&QEM�Q��rҷX����}Ψ��J�s �g��'S4���e�l[�oz:�O��dz���l6{|a��`��$�B�>�D2�A�x����X�ݷ�˅l�'R��X�Y�ݹ�q���W���H�l2��Ve�g��񅝂��;��c�ٽS��kߐ�T\c���h\�S�J7��`��v

�{��P���Ή�`z��\��	��U��u�����g^;�ް�Ֆ2�H�)|tj�B����f\����;#Fw��dI%���ڪ��<�/�X-U٬n���������w4Y͏��
^7/�aߢ��o)����Ts��L�'���/}��lm2�=��SP0J�;�¢\����Z>.��N�R��b��?-�ٔm������iy��M�Þګwg��eF�H,���K���J��O�u{��.����[r� )}h��;#Fw�����ד�C�&�g������ۭ�/t4mv�N�Իr�����8R�s�X{F�����zr�V�����q�|]{�w��Ξ8�7�+�wb�ٖ�Z����zϢR���.�/L��7�g�����������Cr|!�Ӣ�dQ��nN��hp"��-�OTn#8��˧�M۶��Pݑf�"1�ٔ���R[���Y��9{�}���0vwdk�m)A����Ɠɔ%S�aU|@�4�S�.�s4ۥ��Kk<�&�����V�'�fZ�8�&�vs�^�}nOw�Nf,)���)��w��zF�����w��9yO��(<�]Hs7w��xU-;�o[wsz��6�����ֿO�|�]��]���;���t(bA�Á���9yo���C���|�Ψ��Y��������D�}���=`�ȵ��\�Y�Yܾ]���qwO��q�����������1
 Z���b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� �� -�( h!F@1
 Z�Q �B��b �� ����o  
�o�x�@�ۗ��x���ͧ�^Y��3b���h&>�_�>}�|ߣge�Ծ}3q߃�p�������S�B�{`xw���\Oχo?X�?���ى��r  m� �� -�( h!F@1
 Z�Q �B��b �� �� -E��K��yM$7{��J4�c x����`�G=�y&�?~2���ol���;E����w�ʥ�I��c�W�Fɾ����`�æ�!!���r���������<B<���I�qڅ?�5�׿����o� �G�뛞��G�LCo(2��*�X�%�-�����X��ZW��U[��lg��]m1�w:�<Xe���RS!�x~���}���_޼���� �1:2|��~!đ�J{i��s��u;\�eBW��jκ>�7��_z��X���c��,Ȱs�[3��^��=�ڠ��UnUo]��ɭQ�Y��ڑ�Jy�^��S��|�m�Ο}���K�����|��V��xf��l$�&��,!c������>!���k�ok����`��W�Oxj>�]�w�S=��<��$�x��s2�_�h:\�B���㙅ov��nxn���o�d�_�R��v� w��loEk�:k*[j*�ews��>�t��❫Cok}��)���#s��p|M6q
!����c���Z��vۿd/-BckGj+e&^�[XV�,���k�-5-5�ʭ��22�c�H��\���c�RG���ɋ�}��f.��]8Ti���F�c1����2�r�@}yi�O�^�B<�����)!�)O����-[9�S刧Zl�����_��߾�ܫ�ny��Z��Dv:��K-����ɕ�����d+g�2�7~���?��1!��i���m��˰��ۧ;Dڠ�:G�ʣ���I�}0<4��]\�%����e!DsE���w�nx�˿9��훞�db�����a P,�Ĩ�«��Kok�e���c�??ޖ҄�3:;��|��BuV�����o0�K_�M�B�j����䭓��򲡹��z/ߝY�%RZ`���1��xf�g�&Fl����u0G}�oz^��υV���|)_tZJV�kG��[-eW~�ӡ�m���['rk�\灿�9��JԿmr:�G}�_W�RF>�y�݁�{� �(
�^mu���IY�<⩮-���Q�.&�w�P����9�LYM��#sA���L	!~rkT�v�������)�v����m�\ �)���ޑ�|?x��U^��O'�����}n4���_:�y@1Z���]�CD��O�,|�ٌj%h�w����r��+���y�ulaY�b�Ì�N��`�N' �cs1���^�7�8�,�z���~�{���솺ZBX�&9V��c�MN��\Rfh�&�]n�D ���Oqapꔧ�݁)����R����KM�\jt:����}�gd�����`<L+����U!�|h����|hUq����z��㙅�X��g:^�hJ�8J��H_QZ��vTMI�}�~�����m��m�������w��қ���[���K��5:lw�"o�l����Gj+�������\�:�X'?ZƨLdo(R�/ �훝���������b}>�|\�(S�l撔.�������j�YN�B8-%�5��s�7���D��7���|��||w)"s9�-F��J��_��Q���/�$�2��E��ؚj��DoN���À| ��$�h�w�}�9U�=a%*���ӇU�:�h"�2T�,��u�����D��f��r$�Vm1�w�|t�[��'�ۇ�w�"���2F���ܹ E�ovbH��{G^�lΧ���ҕ��Mϫ"* l�"�( �e�� Z�Q �B��b �� �� -�( h!F@1
 Z�Q ���<�KgA    IEND�B`�