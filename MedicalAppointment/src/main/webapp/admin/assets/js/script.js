/*
Author       : Dreamguys
Template Name: Doccure - Bootstrap Admin Template
Version      : 1.0
*/

(function($) {
    "use strict";
	
	// Variables declarations
	
	var $wrapper = $('.main-wrapper');
	var $pageWrapper = $('.page-wrapper');
	var $slimScrolls = $('.slimscroll');
	
	// Sidebar
	
	var Sidemenu = function() {
		this.$menuItem = $('#sidebar-menu a');
	};
	
	function init() {
		var $this = Sidemenu;
		$('#sidebar-menu a').on('click', function(e) {
			if($(this).parent().hasClass('submenu')) {
				e.preventDefault();
			}
			if(!$(this).hasClass('subdrop')) {
				$('ul', $(this).parents('ul:first')).slideUp(350);
				$('a', $(this).parents('ul:first')).removeClass('subdrop');
				$(this).next('ul').slideDown(350);
				$(this).addClass('subdrop');
			} else if($(this).hasClass('subdrop')) {
				$(this).removeClass('subdrop');
				$(this).next('ul').slideUp(350);
			}
		});
		$('#sidebar-menu ul li.submenu a.active').parents('li:last').children('a:first').addClass('active').trigger('click');
	}
	
	// Sidebar Initiate
	init();
	
	// Mobile menu sidebar overlay
	
	$('body').append('<div class="sidebar-overlay"></div>');
	$(document).on('click', '#mobile_btn', function() {
		$wrapper.toggleClass('slide-nav');
		$('.sidebar-overlay').toggleClass('opened');
		$('html').addClass('menu-opened');
		return false;
	});
	
	// Sidebar overlay
	
	$(".sidebar-overlay").on("click", function () {
		$wrapper.removeClass('slide-nav');
		$(".sidebar-overlay").removeClass("opened");
		$('html').removeClass('menu-opened');
	});
	
	// Page Content Height
	
	if($('.page-wrapper').length > 0 ){
		var height = $(window).height();	
		$(".page-wrapper").css("min-height", height);
	}
	
	// Page Content Height Resize
	
	$(window).resize(function(){
		if($('.page-wrapper').length > 0 ){
			var height = $(window).height();
			$(".page-wrapper").css("min-height", height);
		}
	});
	
	// Select 2
	
    if ($('.select').length > 0) {
        $('.select').select2({
            minimumResultsForSearch: -1,
            width: '100%'
        });
    }
	
	// Datetimepicker
	
	if($('.datetimepicker').length > 0 ){
		$('.datetimepicker').datetimepicker({
			format: 'DD/MM/YYYY',
			icons: {
				up: "fa fa-angle-up",
				down: "fa fa-angle-down",
				next: 'fa fa-angle-right',
				previous: 'fa fa-angle-left'
			}
		});
		$('.datetimepicker').on('dp.show',function() {
			$(this).closest('.table-responsive').removeClass('table-responsive').addClass('temp');
		}).on('dp.hide',function() {
			$(this).closest('.temp').addClass('table-responsive').removeClass('temp')
		});
	}

	// Tooltip
	
	if($('[data-toggle="tooltip"]').length > 0 ){
		$('[data-toggle="tooltip"]').tooltip();
	}
	
    // Datatable

    if ($('.datatable').length > 0) {
        $('.datatable').DataTable({
            "bFilter": false,
        });
    }
	
	// Email Inbox

	if($('.clickable-row').length > 0 ){
		$(document).on('click', '.clickable-row', function() {
			window.location = $(this).data("href");
		});
	}

	// Check all email
	
	$(document).on('click', '#check_all', function() {
		$('.checkmail').click();
		return false;
	});
	if($('.checkmail').length > 0) {
		$('.checkmail').each(function() {
			$(this).on('click', function() {
				if($(this).closest('tr').hasClass('checked')) {
					$(this).closest('tr').removeClass('checked');
				} else {
					$(this).closest('tr').addClass('checked');
				}
			});
		});
	}
	
	// Mail important
	
	$(document).on('click', '.mail-important', function() {
		$(this).find('i.fa').toggleClass('fa-star').toggleClass('fa-star-o');
	});
	
	// Summernote
	
	if($('.summernote').length > 0) {
		$('.summernote').summernote({
			height: 200,                 // set editor height
			minHeight: null,             // set minimum height of editor
			maxHeight: null,             // set maximum height of editor
			focus: false                 // set focus to editable area after initializing summernote
		});
	}
	
    // Product thumb images

    if ($('.proimage-thumb li a').length > 0) {
        var full_image = $(this).attr("href");
        $(".proimage-thumb li a").click(function() {
            full_image = $(this).attr("href");
            $(".pro-image img").attr("src", full_image);
            $(".pro-image img").parent().attr("href", full_image);
            return false;
        });
    }

    // Lightgallery

    if ($('#pro_popup').length > 0) {
        $('#pro_popup').lightGallery({
            thumbnail: true,
            selector: 'a'
        });
    }
	
	// Sidebar Slimscroll

	if($slimScrolls.length > 0) {
		$slimScrolls.slimScroll({
			height: 'auto',
			width: '100%',
			position: 'right',
			size: '7px',
			color: '#ccc',
			allowPageScroll: false,
			wheelStep: 10,
			touchScrollStep: 100
		});
		var wHeight = $(window).height() - 60;
		$slimScrolls.height(wHeight);
		$('.sidebar .slimScrollDiv').height(wHeight);
		$(window).resize(function() {
			var rHeight = $(window).height() - 60;
			$slimScrolls.height(rHeight);
			$('.sidebar .slimScrollDiv').height(rHeight);
		});
	}
	
	// Small Sidebar

	$(document).on('click', '#toggle_btn', function() {
		if($('body').hasClass('mini-sidebar')) {
			$('body').removeClass('mini-sidebar');
			$('.subdrop + ul').slideDown();
		} else {
			$('body').addClass('mini-sidebar');
			$('.subdrop + ul').slideUp();
		}
		setTimeout(function(){ 
			mA.redraw();
			mL.redraw();
		}, 300);
		return false;
	});
	$(document).on('mouseover', function(e) {
		e.stopPropagation();
		if($('body').hasClass('mini-sidebar') && $('#toggle_btn').is(':visible')) {
			var targ = $(e.target).closest('.sidebar').length;
			if(targ) {
				$('body').addClass('expand-menu');
				$('.subdrop + ul').slideDown();
			} else {
				$('body').removeClass('expand-menu');
				$('.subdrop + ul').slideUp();
			}
			return false;
		}
	});

	
})(jQuery);
/**
* Template Name: NiceAdmin
* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
* Updated: Apr 20 2024 with Bootstrap v5.3.3
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
*/

(function() {
	"use strict";
  
	/**
	 * Easy selector helper function
	 */
	const select = (el, all = false) => {
	  el = el.trim()
	  if (all) {
		return [...document.querySelectorAll(el)]
	  } else {
		return document.querySelector(el)
	  }
	}
  
	/**
	 * Easy event listener function
	 */
	const on = (type, el, listener, all = false) => {
	  if (all) {
		select(el, all).forEach(e => e.addEventListener(type, listener))
	  } else {
		select(el, all).addEventListener(type, listener)
	  }
	}
  
	/**
	 * Easy on scroll event listener 
	 */
	const onscroll = (el, listener) => {
	  el.addEventListener('scroll', listener)
	}
  
	/**
	 * Sidebar toggle
	 */
	if (select('.toggle-sidebar-btn')) {
	  on('click', '.toggle-sidebar-btn', function(e) {
		select('body').classList.toggle('toggle-sidebar')
	  })
	}
  
	/**
	 * Search bar toggle
	 */
	if (select('.search-bar-toggle')) {
	  on('click', '.search-bar-toggle', function(e) {
		select('.search-bar').classList.toggle('search-bar-show')
	  })
	}
  
	/**
	 * Navbar links active state on scroll
	 */
	let navbarlinks = select('#navbar .scrollto', true)
	const navbarlinksActive = () => {
	  let position = window.scrollY + 200
	  navbarlinks.forEach(navbarlink => {
		if (!navbarlink.hash) return
		let section = select(navbarlink.hash)
		if (!section) return
		if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
		  navbarlink.classList.add('active')
		} else {
		  navbarlink.classList.remove('active')
		}
	  })
	}
	window.addEventListener('load', navbarlinksActive)
	onscroll(document, navbarlinksActive)
  
	/**
	 * Toggle .header-scrolled class to #header when page is scrolled
	 */
	let selectHeader = select('#header')
	if (selectHeader) {
	  const headerScrolled = () => {
		if (window.scrollY > 100) {
		  selectHeader.classList.add('header-scrolled')
		} else {
		  selectHeader.classList.remove('header-scrolled')
		}
	  }
	  window.addEventListener('load', headerScrolled)
	  onscroll(document, headerScrolled)
	}
  
	/**
	 * Back to top button
	 */
	let backtotop = select('.back-to-top')
	if (backtotop) {
	  const toggleBacktotop = () => {
		if (window.scrollY > 100) {
		  backtotop.classList.add('active')
		} else {
		  backtotop.classList.remove('active')
		}
	  }
	  window.addEventListener('load', toggleBacktotop)
	  onscroll(document, toggleBacktotop)
	}
  
	/**
	 * Initiate tooltips
	 */
	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
	  return new bootstrap.Tooltip(tooltipTriggerEl)
	})
  
	/**
	 * Initiate quill editors
	 */
	if (select('.quill-editor-default')) {
	  new Quill('.quill-editor-default', {
		theme: 'snow'
	  });
	}
  
	if (select('.quill-editor-bubble')) {
	  new Quill('.quill-editor-bubble', {
		theme: 'bubble'
	  });
	}
  
	if (select('.quill-editor-full')) {
	  new Quill(".quill-editor-full", {
		modules: {
		  toolbar: [
			[{
			  font: []
			}, {
			  size: []
			}],
			["bold", "italic", "underline", "strike"],
			[{
				color: []
			  },
			  {
				background: []
			  }
			],
			[{
				script: "super"
			  },
			  {
				script: "sub"
			  }
			],
			[{
				list: "ordered"
			  },
			  {
				list: "bullet"
			  },
			  {
				indent: "-1"
			  },
			  {
				indent: "+1"
			  }
			],
			["direction", {
			  align: []
			}],
			["link", "image", "video"],
			["clean"]
		  ]
		},
		theme: "snow"
	  });
	}
  
	/**
	 * Initiate TinyMCE Editor
	 */
  
	const useDarkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;
	const isSmallScreen = window.matchMedia('(max-width: 1023.5px)').matches;
  
	tinymce.init({
	  selector: 'textarea.tinymce-editor',
	  plugins: 'preview importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media codesample table charmap pagebreak nonbreaking anchor insertdatetime advlist lists wordcount help charmap quickbars emoticons accordion',
	  editimage_cors_hosts: ['picsum.photos'],
	  menubar: 'file edit view insert format tools table help',
	  toolbar: "undo redo | accordion accordionremove | blocks fontfamily fontsize | bold italic underline strikethrough | align numlist bullist | link image | table media | lineheight outdent indent| forecolor backcolor removeformat | charmap emoticons | code fullscreen preview | save print | pagebreak anchor codesample | ltr rtl",
	  autosave_ask_before_unload: true,
	  autosave_interval: '30s',
	  autosave_prefix: '{path}{query}-{id}-',
	  autosave_restore_when_empty: false,
	  autosave_retention: '2m',
	  image_advtab: true,
	  link_list: [{
		  title: 'My page 1',
		  value: 'https://www.tiny.cloud'
		},
		{
		  title: 'My page 2',
		  value: 'http://www.moxiecode.com'
		}
	  ],
	  image_list: [{
		  title: 'My page 1',
		  value: 'https://www.tiny.cloud'
		},
		{
		  title: 'My page 2',
		  value: 'http://www.moxiecode.com'
		}
	  ],
	  image_class_list: [{
		  title: 'None',
		  value: ''
		},
		{
		  title: 'Some class',
		  value: 'class-name'
		}
	  ],
	  importcss_append: true,
	  file_picker_callback: (callback, value, meta) => {
		/* Provide file and text for the link dialog */
		if (meta.filetype === 'file') {
		  callback('https://www.google.com/logos/google.jpg', {
			text: 'My text'
		  });
		}
  
		/* Provide image and alt text for the image dialog */
		if (meta.filetype === 'image') {
		  callback('https://www.google.com/logos/google.jpg', {
			alt: 'My alt text'
		  });
		}
  
		/* Provide alternative source and posted for the media dialog */
		if (meta.filetype === 'media') {
		  callback('movie.mp4', {
			source2: 'alt.ogg',
			poster: 'https://www.google.com/logos/google.jpg'
		  });
		}
	  },
	  height: 600,
	  image_caption: true,
	  quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
	  noneditable_class: 'mceNonEditable',
	  toolbar_mode: 'sliding',
	  contextmenu: 'link image table',
	  skin: useDarkMode ? 'oxide-dark' : 'oxide',
	  content_css: useDarkMode ? 'dark' : 'default',
	  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
	});
  
	/**
	 * Initiate Bootstrap validation check
	 */
	var needsValidation = document.querySelectorAll('.needs-validation')
  
	Array.prototype.slice.call(needsValidation)
	  .forEach(function(form) {
		form.addEventListener('submit', function(event) {
		  if (!form.checkValidity()) {
			event.preventDefault()
			event.stopPropagation()
		  }
  
		  form.classList.add('was-validated')
		}, false)
	  })
  
	/**
	 * Initiate Datatables
	 */
	const datatables = select('.datatable', true)
	datatables.forEach(datatable => {
	  new simpleDatatables.DataTable(datatable, {
		perPageSelect: [5, 10, 15, ["All", -1]],
		columns: [{
			select: 2,
			sortSequence: ["desc", "asc"]
		  },
		  {
			select: 3,
			sortSequence: ["desc"]
		  },
		  {
			select: 4,
			cellClass: "green",
			headerClass: "red"
		  }
		]
	  });
	})
  
	/**
	 * Autoresize echart charts
	 */
	const mainContainer = select('#main');
	if (mainContainer) {
	  setTimeout(() => {
		new ResizeObserver(function() {
		  select('.echart', true).forEach(getEchart => {
			echarts.getInstanceByDom(getEchart).resize();
		  })
		}).observe(mainContainer);
	  }, 200);
	}
  
  })();