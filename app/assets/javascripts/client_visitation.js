
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
$(function() {
  Storage.prototype.setObject = function(key, obj) {
    return this.setItem(key, JSON.stringify(obj))
  }

  Storage.prototype.getObject = function(key) {
    var data = this.getItem(key);
    return data ? JSON.parse(this.getItem(key)) : null;
  }

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
  ClientVisitation = (function() {
    var STORAGE_KEY  = 'visitations';
    var BASE_NAME    = 'visitor[visitations_attributes]';
    var ADDRESS_NAME = '[address]';
    var TIME_NAME    = '[time]';

    function ClientVisitation() {
      if (!localStorage.getObject(STORAGE_KEY)) {
        this.clear();
      }
    }

    ClientVisitation.prototype.add = function(address) {
      var time = new Date();
      var visitations = this.getVisitations();

      if(!visitations) {
        visitations = []
      }

      visitations.push([address, time]);
      localStorage.setObject(STORAGE_KEY, visitations);
    };

    ClientVisitation.prototype.clear = function() {
      localStorage.setItem(STORAGE_KEY, []);
    };

    ClientVisitation.prototype.getVisitations = function() {
      return localStorage.getObject(STORAGE_KEY);
    };

    ClientVisitation.prototype.toForm = function(contentId) {
      var container = $(contentId);
      var visitor = this;

      $.each(this.getVisitations(), function(index) {
        var addressName = BASE_NAME + '[' + index + ']' + ADDRESS_NAME;
        var timeName    = BASE_NAME + '[' + index + ']' + TIME_NAME;

        container.append(visitor.hiddenTag(addressName, this[0]));
        container.append(visitor.hiddenTag(timeName,    this[1]));
      });
    };

    ClientVisitation.prototype.hiddenTag = function(name, value) {
      return '<input type="hidden" name="' + name + '" value="' + value + '">';
    };

    return ClientVisitation;
  })();

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
  function setCurrentPage() {
    var formContainer = $('#contact-form');
    var clientVisitation = new ClientVisitation();

    if(formContainer.length) {
      clientVisitation.toForm(formContainer);

    } else {
      clientVisitation.add(window.location.pathname);
    }
  }

  function clearOnSubmit() {
    $('#form-submit').click(function() {
      var clientVisitation = new ClientVisitation();
      clientVisitation.clear();
    });
  }

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
  setCurrentPage();
  clearOnSubmit();
});
