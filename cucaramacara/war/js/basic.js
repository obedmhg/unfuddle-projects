/*
 * SimpleModal Basic Modal Dialog
 * http://www.ericmmartin.com/projects/simplemodal/
 * http://code.google.com/p/simplemodal/
 *
 * Copyright (c) 2010 Eric Martin - http://ericmmartin.com
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 * Revision: $Id: basic.js 254 2010-07-23 05:14:44Z emartin24 $
 */

jQuery(function ($) {
	// Load dialog on click
	$('#basic-modal .basic').click(function (e) {
		$('#basic-modal-content').load('http://localhost:8888/quickView.jsp?imageUrl=https://lh5.googleusercontent.com/-kigJtxW0mUs/UJWnC-k80tI/AAAAAAAAAO4/6cR5TdB3rFk/s1280/P1040800.JPG&details=Efelante%20|%20Efelantito%20de%20colores!!%20:D%20%20|%20170.00%20|%20120.00&categoryId=5805519703666988449', function() {
		
		});
		$('#basic-modal-content').modal();
		return false;
	});
	
});

function quickView(url) {
	$('#basic-modal-content').load(htmlEscape(url) , function() { });
	$('.nivo-controlNav').hide();
	$('#basic-modal-content').modal();
	return false;
}

function htmlEscape(str) {
    return String(str)
            .replace(/ /g, '%20')
}

var toType = function(obj) {
	  return ({}).toString.call(obj).match(/\s([a-zA-Z]+)/)[1].toLowerCase()
}

