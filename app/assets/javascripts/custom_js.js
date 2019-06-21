function ajax_call(url,params,method){
    $.ajax({
        type: method,
        url: url,
        data: params,
        cache: false,
        beforeSend: function(xhr, settings) {
            xhr.setRequestHeader('accept', '*/*;q=0.5, ' + settings.accepts.script);
        },
        statusCode:{
            200:function(){},
            304:function(){},
            404:function(){}},
        isModified:function(){}
    }).responseText;
}

function createSlider(minVal, maxVal, val1, val2){
    $( "#slider-range" ).slider({
        range: true,
        min: parseInt(minVal),
        max: parseInt(maxVal),
        values: [ val1, val2],
        slide: function( event, ui ) {
            $("#amount" ).val( "$" + ui.values[ 0 ]  );
            $("#max-amount").val(" $" + ui.values[ 1 ] );
        },
        stop: function( event, ui ) {
            var search = window.location.href;
            var sort_value = $('#filter :selected').val();
            var rating_value = $('#rating_filter :selected').val();
            var tags = [];
            $(".mutliSelect input:checkbox").each(function(){
                if ($(this).is(':checked'))
                    tags.push($(this).val());
            });
            ajax_call(search,{min_price: ui.values[ 0 ],max_price: ui.values[ 1 ], sort_by:sort_value,rating:rating_value,'tags[]': tags, dish_page: 1},'GET');
        }
    });
    $('#slider-range').draggable();
}

$( function() {
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ));
    $('#max-amount').val("$" +$( "#slider-range" ).slider( "values", 1 ));
  } );
$( function() {
    $('#location_search').autocomplete({
        source: function(request, response) {
            $.ajax({
                url: '/suburbs',
                dataType: 'json',
                data: {
                    keyword: request.term
                },
                success: function(data) {
                    response($.map(data, function(item) {
                        return item;
                    }));
                }
            });
        },
        create: function() {
            $(this).data('ui-autocomplete')._renderItem = function(ul, item) {
                return $('<li>').append(item.name + " <div class='dropdown-menu'/>").appendTo(ul);
            };
        },
        focus: function( event, ui ) {
            $( "#location_search" ).val( ui.item.name );
            return false;
        },
        select: function( event, ui ) {
            $( "#location_search" ).val( ui.item.name );
            $( "#location_search_form" ).submit();
            event.stopPropagation();
            event.preventDefault();
            return false;
        }
    });

    $(".dropdown dt a").on('click', function() {
        $(this).parent().parent().find('.mutliSelect ul').slideToggle('fast');
    });
    $(".dropdown dd ul li a").on('click', function() {
        $(this).parent().parent().find('.mutliSelect ul').hide();
    });
    function getSelectedValue(id) {
        return $("#" + id).find("dt a span.value").html();
    }
    $(document).bind('click', function(e) {
        var $clicked = $(e.target);
        if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
    });
    $('.mutliSelect input[type="checkbox"]').on('click', function() {
        var action = $(this).data('action');
        var selectedValue = jQuery(this).val();
        var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').parent().text(),
            title = $(this).parent().text() + ",";

        var hida = $(this).parent().parent().parent().parent().parent().find(".hida");
        var msel = $(this).parent().parent().parent().parent().parent().find('.multiSel');

        if ($(this).is(':checked')) {
            var html = '<span title="' + title + '">' + title + '</span>';
            $(this).parent().parent().parent().parent().parent().find('.multiSel').append(html);
            hida.hide();
        }
        else
        {   
            console.log($('span[title="' + title + '"]'))
            $('span[title="' + title + '"]').remove();
            var tt = msel.find('span').text();
            if(tt=='')
            {
                hida.show();
            }
        }
        var meals = [];
        var dietarian = [];
        $(".mutliSelect .meals").each(function(){
            if ($(this).is(':checked'))
                meals.push($(this).val());
        });

        $(".mutliSelect .dietarian").each(function(){
            if ($(this).is(':checked'))
                dietarian.push($(this).val());
        });

        var min_price = $("#amount").val().replace(/\D/g,'');
        var max_price = $("#max-amount").val().replace(/\D/g,'');
        var sort_value = $('#filter :selected').val();
        var rating_value = $('#rating_filter :selected').val();
        ajax_call(search,{min_price: min_price, max_price: max_price, sort_by:sort_value,rating:rating_value,'meals[]': meals, 'dietarian[]': dietarian, dish_page: 1},'GET');
    });
});