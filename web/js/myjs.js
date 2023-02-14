$(document).ready(function() {
    console.log('ready');
    init();
});

function init(){
   onshowinfo();
}

function onshowinfo(){
	$('#modalmovies').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            var nombre = button.data('nombre');
            var id = button.data('id');
            var modal = $(this);
            modal.find('.modal-header h4').text(nombre)
            $.ajax({
                type: "GET",
                url: "Controller?op=detail&personid="+id,
                success : function(info) {
                        $(".modal-body").html(info);
                }
            })
	})
}
