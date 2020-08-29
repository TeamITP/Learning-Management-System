function inputChanged() {
    if (document.getElementById("fileUpload").value != "") {
        var value = document.getElementById("fileUpload").value;
        var sub = value.split('.').reverse()[0];
        if (sub == "pdf") {
            document.getElementById("btnUpload").style.display = "none";
            document.getElementById("fileName").innerHTML = value.substring(12);
            document.getElementById("warning").style.display = "none";
            document.getElementById("pdfContainer").style.display = "block";
        } else {
            document.getElementById("warning").style.display = "block";
            document.getElementById("pdfContainer").style.display = "none";
            document.getElementById("btnUpload").style.display = "block";
        }
    } else {
        document.getElementById("btnUpload").style.display = "block";
        document.getElementById("pdfContainer").style.display = "none";
    }
}