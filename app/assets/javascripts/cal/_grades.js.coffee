$( document ).on 'ready page:load', ( event ) ->
  
  $( document ).on 'change', '#grade_student', () ->
      $( '#grade_subject' )
        .empty()
        .append($("<option></option>")
        .attr("value", "")
        .text("- Seleccionar -"))

      $this = $( this )
      if( $this.val() != "" )
        $.ajax({ 
          url: '/cal/grades/get_subjects',
          type: 'GET',
          dataType: 'json',
          data: { s: $this.val() },
          success: (data) ->
            if data['success'] == 'true'
              if data['subjects'].length > 0
                for subject in data['subjects']
                  $( '#grade_subject' )
                    .append($("<option></option>")
                    .attr("value", subject.id)
                    .text(subject.nombre_materia));
              else
                $( '#grade_subject' )
                  .empty()
                  .append($("<option></option>")
                  .attr("value", "")
                  .text("- Seleccionar -"));
        })

  $( document ).on 'change', '#grade_subject', () ->
      $( '#grade_student_has_subject_id' )
        .val( "" )
      $this = $( this )
      if( $this.val() != "" )
        $.ajax({
          url: '/cal/grades/get_group',
          type: 'GET',
          dataType: 'json',
          data: { stu: $( '#grade_student' ).val(), sub: $this.val() },
          success: (data) ->
            if data['success'] == 'true'
              if data['student_subject'] > 0
                $( '#grade_student_has_subject_id' ).val( data['student_subject'] )
              else
                $( '#grade_student_has_subject_id' ).val( "" )
        })
