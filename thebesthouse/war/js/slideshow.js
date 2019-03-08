var imageId;

var FOTO = {

}

FOTO.SS = {
	mainImageId: 0,
	thumbWidthExact: 70, //how wide is our thumbnail?
	thumbWidth: 85,
	thumbOffset: 5,
	offsetSlot: 0,
	offsetPos: 0,
	imageToggle: 0, //used for fade effect
	lastShiftDirection: 0,
	paused: 1, //should we cycle through images?
	duration: 3000, //how long do we look at each image?
	interval: 0, //used for our timer
	lastCycle: 0, //when did we last look at an image?
	progressAnimationId: 0,
	fixIEInterval: 0,
	width: 900,
	height: 600,

	getUrl: function(id){
		return '/fetch.php?imageId='+id+'&width='+this.width+'&height='+this.height;
	},

	//sets the main image to the id passed in once the image has been loaded by the browser
	setMainImage: function(id){
		//set the current image, and load it
		if(FOTO.SS.mainImageId == id) //we're already on this image
			return false;

		var url = FOTO.SS.getUrl(id);

		//window.alert('setting id '+id);

		//$('#slideshow_main_image_'+FOTO.SS.getToggle(true)).fadeOut(1000);
		//$('#slideshow_main_image').fadeOut(1000);
		//window.alert('fetching: '+url);
		SKEL.Image.preload(url,FOTO.SS.displayMainImage,url);

		//SKEL.Image.preload(url,FOTO.SS.transitionMainImage);
		FOTO.SS.mainImageId = id;
	},

	getToggle: function(active){
		return(active ? FOTO.SS.imageToggle : (FOTO.SS.imageToggle ? 0 : 1));
	},

	//sets the current main image src to the image that is loaded in
	displayMainImage: function(img){
		var newSrc = ($(this).get())[0].src;
		$('#slideshow_main_image').attr('src',newSrc);
		//$('#slideshow_main_image').fadeIn(500);

	},

	//same as above, but with bells and whistles
	transitionMainImage: function(img){
		var newSrc = img.currentTarget.src;
		//$('#slideshow_main_image_'+FOTO.SS.getToggle(false)).attr('src',newSrc);
		//$('#slideshow_main_image_'+FOTO.SS.getToggle(false)).fadeIn(1000);

		var dest;
		if(FOTO.SS.lastShiftDirection != 0){
			//console.log('left');
			dest = '-740px';
		} else {
			//console.log('right');
			dest = '740px';
		}

		SKEL.EFFECTS.Slide.animate($('#slideshow_main_image'),'left','0px',dest,250,SKEL.Transitions.quadOut);
		setTimeout(function(){
			$('#slideshow_main_image').attr('src',newSrc);
			SKEL.EFFECTS.Slide.animate($('#slideshow_main_image'),'left',dest,'0px',250,SKEL.Transitions.quadOut);
		},300);
		//FOTO.SS.imageToggle = (FOTO.SS.imageToggle ? 0 : 1); //flip it
	},

	//preloads all the images in the set
	preloadImageMains: function(imageIds){
		for(var key in imageIds){
			var id = imageIds[key];
			url = '/fetch.php?imageId='+id+'&width=600&height=400';
			//console.log('preloading',id,url);
			SKEL.Image.preload(url);
			//SKEL.Image.preload(url,function(ev){console.log('loaded',ev.currentTarget.foo);});
		}
	},

	//preloads the thumbnails in the set of images
	preloadImageThumbs: function(imageIds){
		for(var key in imageIds){
			var id = imageIds[key];
			url = '/fetch.php?imageId='+id+'&width=100&height=100&crop=1';
			SKEL.Image.preload(url);
		}
	},

	//fetches the imageIds of the next "page" and starts preloading those images
	preloadPage: function(page){

	},

	//returns the next element in the list
	getNextSlot: function(){
		var obj = $('.slideshow_bar_thumb[slot='+(FOTO.SS.offsetSlot+1)+']');
		if(!obj || obj.length == 0){
			//if we don't have an object, we hit the end, jump to the begining
			FOTO.SS.offsetSlot = 0;
			obj = $('.slideshow_bar_thumb[slot='+(FOTO.SS.offsetSlot)+']');
		}
		return obj;
	},

	getCurrentSlot: function(){
		var obj = $('.slideshow_bar_thumb[slot='+(FOTO.SS.offsetSlot)+']');
		if(!obj || obj.length == 0){
			//if we don't have an object, try the begining
			FOTO.SS.offsetSlot = 0;
			obj = $('.slideshow_bar_thumb[slot='+(FOTO.SS.offsetSlot)+']');
		}
		return obj;
	},

	animateProgressBar: function(){
		var srcOffset = '-120px';
		var newOffset = '1px';
		FOTO.SS.progressAnimationId = SKEL.EFFECTS.Slide.animate($('#percent_bar'),'background-position',srcOffset,newOffset,FOTO.SS.duration,SKEL.Transitions.linear);
	},

	cycleImage: function(){

		//FOTO.SS.animateProgressBar();

		var obj = FOTO.SS.getNextSlot();

		if(obj){
			//has the next image finished loading?
			//var img = ($(obj).children('img'))[0];

			var nextUrl = FOTO.SS.getUrl(obj.attr('imageId'));
			var img = SKEL.Image.imageCache[nextUrl];

			//if the image finished loading, go to it
			if(img && img.complete){
				$(obj).click();
			} else {
				//try to load it now
				SKEL.Image.preload(nextUrl);
			}
		}
	},

	play: function(){
		if(!FOTO.SS.paused){
			//FOTO.SS.animateProgressBar();
			FOTO.SS.interval = setInterval(FOTO.SS.cycleImage,FOTO.SS.duration);
		}
	},

	resetTimer: function(){
		if(FOTO.SS.interval){
			clearInterval(FOTO.SS.interval);
			if(FOTO.SS.progressAnimationId)
				SKEL.EFFECTS.Slide.stopByIntervalId(FOTO.SS.progressAnimationId);

			FOTO.SS.play();
		}
	},

	pause: function(){
		if(FOTO.SS.interval){
			clearInterval(FOTO.SS.interval);
			if(FOTO.SS.progressAnimationId)
				SKEL.EFFECTS.Slide.stopByIntervalId(FOTO.SS.progressAnimationId);
		}
	}


}

function testMe(foo,bar){
	console.log('testMe',foo,bar);
}



$(document).ready(function(){
	/*setTimeout(function(){
	$('#header').slideUp();
	},5000);*/

	FOTO.SS.offsetSlot = 0;

	$('#slideshow_play').click(function(){
		if(FOTO.SS.paused){
			FOTO.SS.paused = 0;
			FOTO.SS.play();
			$(this).addClass('slideshow_disabled');
			$(this).css('cursor','default');
			$('#slideshow_stop').removeClass('slideshow_disabled');
			$('#slideshow_stop').css('cursor','pointer');
		}
	});
	$('#slideshow_stop').click(function(){
		if(!FOTO.SS.paused){
			FOTO.SS.paused = 1;
			FOTO.SS.pause();
			$(this).addClass('slideshow_disabled');
			$(this).css('cursor','default');
			$('#slideshow_play').removeClass('slideshow_disabled');
			$('#slideshow_play').css('cursor','pointer');
		}
	});

	$('.slideshow_bar_thumb').click(function(){
		//reset our timers
		if(!FOTO.SS.paused){
			FOTO.SS.resetTimer();
		}

		//when someone clicks a thumb, set the main image
		id = $(this).attr('imageId');

		if(id == FOTO.SS.mainImageId)
			return false;

		if(FOTO.SS.mainImageId > 0){
			//animate the old image up
			SKEL.EFFECTS.Slide.animate($('.slideshow_bar_thumb[imageid='+FOTO.SS.mainImageId+']'),'top','20px','0px',500,SKEL.Transitions.quadOut);

		}

		//animate the new image down
		SKEL.EFFECTS.Slide.animate($(this),'top','0px','20px',250,SKEL.Transitions.quadOut);

		//var item = document.getElementById('slot_1');
		//console.log(item);
		//console.log($(this));
		//window.alert('calling item');
		//window.alert($(this));
		//item = $(this).get();
		//item = $(this);
		//window.alert('called');
		//item = item[0];

		var obj = SKEL.UTIL.getPosition(this);

		var bar = SKEL.UTIL.getPosition(document.getElementById('slideshow_nav'));

		var offset = (obj.x - bar.x) - FOTO.SS.thumbOffset;
		
		var slot = parseInt(offset/FOTO.SS.thumbWidth);
		var shift = 0;
		var pivot = 4;

		//the offset will let us calculate our slot position
		//console.log('offset',offset,slot);

		//var shift = (slot * FOTO.SS.thumbWidth)+'px';
		if(slot > pivot){
			shift = ((slot -pivot) * FOTO.SS.thumbWidth);
		} else if (slot < pivot){
			shift = ((pivot-slot) * FOTO.SS.thumbWidth);
		}

		FOTO.SS.offsetSlot = parseInt($(this).attr('slot'));

		//center this offsletSlot
		
		var barWidth = $('#slideshow_nav').width();
		var numberOfSlidesPerBar = barWidth/FOTO.SS.thumbWidth;
		
		var offsetTile = ((numberOfSlidesPerBar/2)-0.5);
		

		shift = (FOTO.SS.offsetSlot* FOTO.SS.thumbWidth);
		shift -= (FOTO.SS.thumbWidth * offsetTile);
		shift = (shift * -1);
		var oldOffsetStr = FOTO.SS.offsetPos+'px';

		//console.log('shift',shift,oldOffsetStr);
		if(shift != 0){

			var shiftStr = shift+'px';
			if(FOTO.SS.offsetPos > shift){
				FOTO.SS.lastShiftDirection = 0;
			} else {
				FOTO.SS.lastShiftDirection = 1;
			}
			//we look at the current offset to make the animation smooth if we clicked inbetween a transition
			var barOffset = $('#slideshow_bar').css('left');
			if(!barOffset || barOffset == 'auto')
				barOffset = '0px';

			//window.alert(barOffset+ " | " + shiftStr);
			if(FOTO.SS.fixIEInterval)
				SKEL.EFFECTS.Slide.stopByIntervalId(FOTO.SS.fixIEInterval);

			FOTO.SS.fixIEInterval = SKEL.EFFECTS.Slide.animate($('#slideshow_bar'),'left',barOffset,shiftStr,1000,SKEL.Transitions.backOut);
			FOTO.SS.offsetPos = shift;
		}

		FOTO.SS.setMainImage(id);

		return false; //stop the click from taking us to the page

	});

});