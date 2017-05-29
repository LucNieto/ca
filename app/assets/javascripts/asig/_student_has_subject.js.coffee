$( document ).on 'change', '#student_has_subject_school_cycle', () ->
    $( '#student_has_subject_subject' )
      .empty()
      .append($("<option></option>")
      .attr("value", "")
      .text("- Seleccionar -"))
    $( '#student_has_subject_school_cycle_has_subject_id' )
      .val( "" )
    $this = $( this )
    if( $this.val() != "" )
      $.ajax({
        url: '/asig/student_has_subjects/get_subjects',
        type: 'GET',
        dataType: 'json',
        data: { c: $this.val() },
        success: (data) ->
          if data['success'] == 'true'
            if data['subjects'].length > 0
              for subject in data['subjects']
                $( '#student_has_subject_subject' )
                  .append($("<option></option>")
                  .attr("value", subject.id)
                  .text(subject.nombre_materia));
            else
              $( '#student_has_subject_subject' )
                .empty()
                .append($("<option></option>")
                .attr("value", "")
                .text("- Seleccionar -"));
      })

$( document ).on 'change', '#student_has_subject_subject', () ->
    $( '#student_has_subject_school_cycle_has_subject_id' )
      .val( "" )
    $this = $( this )
    if( $this.val() != "" )
      $.ajax({
        url: '/asig/student_has_subjects/get_group',
        type: 'GET',
        dataType: 'json',
        data: { c: $( '#student_has_subject_school_cycle' ).val(), s: $this.val() },
        success: (data) ->
          if data['success'] == 'true'
            if data['group'] > 0
              console.log data['group']
              $( '#student_has_subject_school_cycle_has_subject_id' ).val( data['group'] )
            else
              $( '#student_has_subject_school_cycle_has_subject_id' ).val( "" )
      })
