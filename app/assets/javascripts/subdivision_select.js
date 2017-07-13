var SubdivisionSelect = (function() {
  SubdivisionSelect.subdivisionSelector = "select[data-subdivision-selector]";
  SubdivisionSelect.countrySelector = "select[id$=country]";

  function SubdivisionSelect(element) {
    this._countrySelect = element;
    this._subdivisionSelect = $(element).
      closest("form").
      find(SubdivisionSelect.subdivisionSelector);
  };

  SubdivisionSelect.init = function () {
    var klass = this;

    return $(klass.countrySelector).each(function() {
      return new klass(this).init();
    });
  };

  SubdivisionSelect.prototype.init = function() {
    var self = this;
    self._enabledInputsBeforeSubmit();

    self.country = this._countrySelect.val();
    setInterval(poll, 500);
    this._countrySelect.change(onChange);

    function poll() {
      if (self.country != self._countrySelect.val()) {
        onChange();
      }
    }

    function onChange() {
      self.country = self._countrySelect.val();
      $.ajax( {
        url: "/subdivisions",
        data: { country_code: self.country }
      }).done(function(newSubdivisions) {
        self._clearSubdivisionSelect();
        self._updateSubdivisionSelect(newSubdivisions);
      });
    }
  };

  SubdivisionSelect.prototype._updateSubdivisionSelect = function(newSubdivisions) {
    var self = this;
    var isEmpty = $.isEmptyObject(newSubdivisions);

    $.each(newSubdivisions, function(alpha2, name) {
      self._subdivisionSelect.append($("<option></option>").attr("value", alpha2).text(name));
    });

    // Disable the select if there are no newSubdivisions (and un-do that once there are some)
    self._subdivisionSelect.prop("disabled", isEmpty);

    // If there are none, make it say "none"
    if (isEmpty) {
      self._subdivisionSelect.append($("<option></option>").text("none"));
    }
  };

  // Disabling selects means they won't POST with the form.
  // Solution: right before submiting a form, enabled them.
  SubdivisionSelect.prototype._enabledInputsBeforeSubmit = function() {
    $('form').bind('submit', function() {
      $(this).find('select').removeAttr('disabled');
    });
  };

  // Not only empty the select, but:
  // if the first element is blank, add a blank element before all others
  SubdivisionSelect.prototype._clearSubdivisionSelect = function() {
    var includeBlank = this._subdivisionSelect.children().first().text() === "";

    this._subdivisionSelect.empty();

    if (includeBlank) {
      this._subdivisionSelect.append($("<option></option>"));
    }
  };

  return SubdivisionSelect;
})();

$(function() {
  SubdivisionSelect.init();
});
