$indexController = function () {
    $bakcgroundVideo = undefined;
    $registerView = undefined;
    $successView = undefined;
    $mailInput = undefined;

    function sendMailCmd() {
        if ($mailInput !== undefined) {
            var mail = $mailInput.value;
            if (mail !== undefined && mail !== "" && mail !== " " && mail.indexOf("@") > -1) {
                $.getJSON("/home/send?email=" + mail).then(function (response) {
                    if (response.isOk) {
                        $registerView.style.display = "none";
                        $successView.style.display = "block";
                    } else {
                        alert(response.message);
                    }
                });
            } else {
                alert("Geçersiz mail adresi girdiniz.");
            }
        }
    }

    this.sendMail = function () {
        sendMailCmd();
    }

    this.init = function () {
        $bakcgroundVideo = document.getElementById("backgroundVideo");
        $registerView = document.getElementById("registerView");
        $successView = document.getElementById("successView");
        $mailInput = document.getElementById("mailInput");
        if ($bakcgroundVideo != undefined) {
            $bakcgroundVideo.play();
        }
    }

}