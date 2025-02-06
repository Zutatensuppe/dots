function sa
    ssh-add -D
    
    # Create temporary askpass script
    set askpass_script (mktemp)
    chmod 700 $askpass_script
    echo '#!/bin/sh' > $askpass_script
    echo "secret-tool lookup login ubuntu" >> $askpass_script
    
    # Add key and capture output
    env SSH_ASKPASS=$askpass_script DISPLAY=":0" setsid ssh-add ~/.ssh/id_rsa </dev/null 2>&1 | string collect
    rm $askpass_script
    echo ""

    # Add other keys
    ssh-add ~/.ssh/id_ed25519 </dev/null 2>&1 | string collect
    echo ""
    ssh-add ~/.ssh/work_key </dev/null 2>&1 | string collect
    echo ""
end
