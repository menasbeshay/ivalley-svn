var Imtech = {};
Imtech.Pager = function () {
    this.paragraphsPerPage = 3;
    this.currentPage = 1;
    this.pagingControlsContainer = "#pagingControls";
    this.pagingContainerPath = "#Intcontent";

    this.numPages = function () {
        var numPages = 0;
        if (this.paragraphs != null && this.paragraphsPerPage != null) {
            numPages = Math.ceil(this.paragraphs.length / this.paragraphsPerPage);
        }

        return numPages;
    };

    this.showPage = function (page, lang) {
        this.currentPage = page;
        var html = "";
        for (var i = (page - 1) * this.paragraphsPerPage; i < ((page - 1) * this.paragraphsPerPage) + this.paragraphsPerPage; i++) {
            if (i < this.paragraphs.length) {
                var elem = this.paragraphs.get(i);
                html += "<" + elem.tagName + ">" + elem.innerHTML + "</" + elem.tagName + ">";
            }
        }

        $(this.pagingContainerPath).html(html);

        renderControls(this.pagingControlsContainer, this.currentPage, this.numPages(), lang);
    }

    var renderControls = function (container, currentPage, numPages, lang) {
        var mytext = "";
        if (lang == "en") {
            mytext = "<b>Page: </b><ul>";
        }
        else {
            mytext = "<b>صفحة: </b><ul>";
        }
        var pagingControls = mytext;
        for (var i = 1; i <= numPages; i++) {
            if (i != currentPage) {
                pagingControls += "<li><a href='#' onclick='pager.showPage(" + i + ", \"";
                pagingControls += lang + "\"); return false;'>" + i + "</a></li>";
            } else {
                pagingControls += "<li><a class='selected' href='#' onclick='return false;'>" + i + "</a></li>";
            }
        }

        pagingControls += "</ul>";

        $(container).html(pagingControls);
    }
}