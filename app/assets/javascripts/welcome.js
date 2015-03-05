function elemSlideDown(elem) {
    elem.hide();
    elem.slideDown(400);
}

var main = function() {
    elemSlideDown($('.alert'));
    elemSlideDown($('.notice'));
}

$(document).ready(main)
