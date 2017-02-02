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
});
