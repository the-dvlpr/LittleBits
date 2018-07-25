document.addEventListener("turbolinks:load", function() {
  if (document.getElementById("materials-display")) {
    // if comma key is pressed within materials used box
    $("#materials-used").on("keyup", function(e) {
      if (e.keyCode === 188) {
        // lowercase string and replace inner whitespace with dashes
        // then remove anything not lowercase letter, number, or dash
        material = $("#materials-used")
          .val()
          .trim()
          .toLowerCase()
          .replace(/\s+/g, "-")
          .replace(/[^0-9a-z-]/g, "");

        // append as child to materials-display div
        $("#materials-display").append(
          '<div class="displayed-material">' + material + "</div>"
        );

        // toggle message
        new_invention_materials_message_display();

        // clear input
        $("#materials-used").val("");
      }
    });

    // show/hide "click to remove" message for materials display
    function new_invention_materials_message_display() {
      if ($("#materials-display").children().length > 0) {
        $("#materials-remove-message").show();
      } else {
        $("#materials-remove-message").hide();
      }
    }

    // remove displayed material on click
    $("#materials-display").on("click", ".displayed-material", function(e) {
      $(e.target).remove();

      // toggle message
      new_invention_materials_message_display();
    });

    //add used materials to hidden form field
    $("#new_invention").submit(function(e) {
      if ($(".checkbox-container input:checkbox:checked").length == 0) {
        $("#bits-notice").show();
        return false;
      }

      // push each to space-seperated string
      materials = "";
      $(".displayed-material").each(function() {
        materials += $(this).text() + " ";
      });

      // append input element to form with materials
      var input = document.createElement("input");
      input.type = "text";
      input.name = "materials_used_names";
      input.value = materials;
      input.hidden = true;
      $("#new_invention").append(input);
    });
  }
});
