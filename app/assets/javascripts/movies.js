$(document).on('turbolinks:load', function() {
  $('.multiselect').multiselect({
    enableFiltering: true,
    includeSelectAllOption: false,
    enableCaseInsensitiveFiltering: true,
    maxHeight: 300,
    nonSelectedText: 'Nenhum selecionado',
    filterPlaceholder: 'Procure',
    selectAllText: 'Selecionar todos',
    buttonClass: "btn btn-default " + $('.multiselect').data('size')
  });

  $(".add_to_cart").on("ajax:before", function (e){
    $("#loadingModal").modal('show');
  }).on("ajax:complete", function (e, xhr, status){
    $("#loadingModal").modal('hide');
  }).on("ajax:error", function (e, xhr, status, error){
    alert("ERRO! " + error);
  });

  $("#loadingModal").modal({
    backdrop: true,
    keyboard: false,
    focus: true,
    show: false
  })
});
