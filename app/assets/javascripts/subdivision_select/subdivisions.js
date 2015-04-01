$(document).ready(function() {
  function updateSubdivisionsSelect(newSubdivisions) {
    var subdivisionSelect = $("select[id$=_subdivision]");
    var isEmpty = $.isEmptyObject(newSubdivisions);

    clearSelect(subdivisionSelect);

    $.each(newSubdivisions, function(alpha2, name) {
      subdivisionSelect.append($("<option></option>").attr("value", alpha2).text(name));
    });

    // Disable the select if there are no newSubdivisions (and un-do that once there are some)
    subdivisionSelect.prop("disabled", isEmpty);

    // If there are none, make it say "none"
    if (isEmpty) {
      subdivisionSelect.append($("<option></option>").text("none"));
    }
  }

  // Not only empty the select, but:
  // if the first element is blank, add a blank element before all others
  function clearSelect(selectToClear) {
    var includeBlank = selectToClear.children().first().text() === "";

    selectToClear.empty();

    if (includeBlank) {
      selectToClear.append($("<option></option>"));
    }
  }


  function populateSelectViaAjax() {
    $.ajax( {
      url: "/subdivisions",
      data: { country_code: $(this).val() },
      success: updateSubdivisionsSelect
    } );
  }

  $("select[id$=_country]").change(populateSelectViaAjax);
});
