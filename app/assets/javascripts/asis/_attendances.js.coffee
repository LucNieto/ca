$( document ).on 'ready page:load', ( event ) ->

  $( document ).on 'change', '#attendance_student', () ->
    $( '#attendance_subject' )
      .empty()
      .append($("<option></option>")
      .attr("value", "")
      .text("- Seleccionar -"))

    $this = $( this )
    if( $this.val() != "" )
      $.ajax({
        url: '/asis/attendances/get_subjects',
        type: 'GET',
        dataType: 'json',
        data: { s: $this.val() },
        success: (data) ->
          if data['success'] == 'true'
            if data['subjects'].length > 0
              for subject in data['subjects']
                $( '#attendance_subject' )
                  .append($("<option></option>")
                  .attr("value", subject.id)
                  .text(subject.nombre_materia));
            else
              $( '#attendance_subject' )
                .empty()
                .append($("<option></option>")
                .attr("value", "")
                .text("- Seleccionar -"));
      })

  $( document ).on 'change', '#attendance_subject', () ->
    $( '#attendance_student_has_subject_id' )
      .val( "" )
    $this = $( this )
    if( $this.val() != "" )
      $.ajax({
        url: '/asis/attendances/get_group',
        type: 'GET',
        dataType: 'json',
        data: { stu: $( '#attendance_student' ).val(), sub: $this.val() },
        success: (data) ->
          if data['success'] == 'true'
            if data['student_subject'] > 0
              $( '#attendance_student_has_subject_id' ).val( data['student_subject'] )
            else
              $( '#attendance_student_has_subject_id' ).val( "" )
      })
