<############################################
    Module  : VsoReleaseManagerClient
    Company : ItsZap Inc.
    Author  : Riwut Libinuko 
    Blog    : http://blog.libinuko.com
    Licence : GNU GENERAL PUBLIC LICENSE
    Copyright © 2016, ItsZap Inc, Riwut Libinuko (cakriwut@gmail.com). All Rights Reserved
#############################################>

function Set-ConsolePosition ([int]$x) { 
    # Get current cursor position and store away 
    $position=$host.ui.rawui.cursorposition 
    # Store new X Co-ordinate away 
    $position.x=$x 
    # Place modified location back to $HOST 
    $host.ui.rawui.cursorposition=$position 
}