$(document).ready(function(){
  window_width = $(window).width();

  // Make the images from the card fill the hole space
  hipster_cards.fitBackgroundForCards();

});

hipster_cards = {
    misc:{
        navbar_menu_visible: 0
    },

    fitBackgroundForCards: function(){
        $('[data-background="image"]').each(function(){
            $this = $(this);

            background_src = $this.data("src");

            if(background_src != "undefined"){
                new_css = {
                    "background-image": "url('" + background_src + "')",
                    "background-position": "center center",
                    "background-size": "cover"
                };

                $this.css(new_css);
            }
        });

        $('.card .header img').each(function(){
            $card = $(this).parent().parent();
            $header = $(this).parent();

            background_src = $(this).attr("src");

            if(background_src != "undefined"){
                new_css = {
                    "background-image": "url('" + background_src + "')",
                    "background-position": "center center",
                    "background-size": "cover"
                };

                $header.css(new_css);
            }
        });

    },
}

function dropHandler(ev) {
  console.log('File(s) dropped');

  // Prevent default behavior (Prevent file from being opened)
  ev.preventDefault();

  if (ev.dataTransfer.items) {
    // Use DataTransferItemList interface to access the file(s)
    for (var i = 0; i < ev.dataTransfer.items.length; i++) {
      // If dropped items aren't files, reject them
      if (ev.dataTransfer.items[i].kind === 'file') {
        var file = ev.dataTransfer.items[i].getAsFile();
        console.log('... file[' + i + '].name = ' + file.name);
      }
    }
  } else {
    // Use DataTransfer interface to access the file(s)
    for (var i = 0; i < ev.dataTransfer.files.length; i++) {
      console.log('... file[' + i + '].name = ' + ev.dataTransfer.files[i].name);
    }
  }

  // Pass event to removeDragData for cleanup
  removeDragData(ev)
}

function dragOverHandler(ev) {
  console.log('File(s) in drop zone');

  // Prevent default behavior (Prevent file from being opened)
  ev.preventDefault();
}

function removeDragData(ev) {
  console.log('Removing drag data')

  if (ev.dataTransfer.items) {
    // Use DataTransferItemList interface to remove the drag data
    ev.dataTransfer.items.clear();
  } else {
    // Use DataTransfer interface to remove the drag data
    ev.dataTransfer.clearData();
  }
}
