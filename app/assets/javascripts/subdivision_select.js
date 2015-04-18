var SubdivisionSelect = (function() {
  function SubdivisionSelect(element) {
    this._element = $(element);
  };

  SubdivisionSelect.subdivisionSelector = "select[id$=subdivision]";
  SubdivisionSelect.countrySelector = "select[id$=country]";

  SubdivisionSelect.init = function () {
    var klass = this;

    return $(klass.subdivisionSelector).each(function() {
      return new klass(this).init();
    });
  };

  SubdivisionSelect.prototype.init = function() {
    var self = this;

    $(this.constructor.countrySelector).change(function() {
      $.ajax( {
        url: "/subdivisions",
        data: { country_code: $(this).val() }
      }).done(function(newSubdivisions) {
        self._clearSubdivisionSelect();
        self._updateSubdivisionSelect(newSubdivisions);
      });
    });
  };

  SubdivisionSelect.prototype._updateSubdivisionSelect = function(newSubdivisions) {
    var self = this;
    var isEmpty = $.isEmptyObject(newSubdivisions);

    $.each(newSubdivisions, function(alpha2, name) {
      self._element.append($("<option></option>").attr("value", alpha2).text(name));
    });

    // Disable the select if there are no newSubdivisions (and un-do that once there are some)
    self._element.prop("disabled", isEmpty);

    // If there are none, make it say "none"
    if (isEmpty) {
      subdivisionSelect.append($("<option></option>").text("none"));
    }
  };

  // Not only empty the select, but:
  // if the first element is blank, add a blank element before all others
  SubdivisionSelect.prototype._clearSubdivisionSelect = function() {
    var includeBlank = this._element.children().first().text() === "";

    this._element.empty();

    if (includeBlank) {
      this._element.append($("<option></option>"));
    }
  };

  return SubdivisionSelect;
})();

$(function() {
  SubdivisionSelect.init();
});
