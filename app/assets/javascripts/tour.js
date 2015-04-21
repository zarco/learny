var tour = new Tour({steps: [
      {      
        title: '¡Te damos la bienvenida a Learny!',
        content: 'A continuación te mostramos los puntos escenciales que debes conocer.',
        orphan: true,
        backdrop: true
      },
      {
        element: '#carousel_next_workshops',
        title: 'Talleres registrados',
        content: 'Cuando propongas talleres, aquí se mostrarán.'
      },
      {
        element: '#workshop_name',
        title: 'Proner un nuevo curso',
        content: 'Recuerda que para proponer un curso, el nombre debe ser claro.'
      },
      {
        element: '#workshop_description',
        title: 'Descripción del curso',
        content: 'Te recomendamos que la descripción sea llamativa para que consigas más estudiantes.'
      },
      {
        element: '#workshop_free',
        title: 'Curso gratuito',
        content: 'Si quieres comenzar a ganar fama en Learny, puedes comenzar dando cursos gratuitos. Solo marca la casilla y ¡Listo!'
      },
      {
        element: '#workshop_previous_skills',
        title: 'Conocimientos requeridos del estudiante',
        content: 'Si es necesario que tus estudiantes sepan algo antes de tomar tu curso puedes comentarlo aquí.'
      },
      {
        element: '#establecimiento',
        title: 'Buscar establecimiento',
        content: 'Puedes seleccionar el establecimiento que se adapte a tu horario, si aún no tienes un espacio , no te preocupes, tu curso será publicado para que comience a ganar popularidad hasta que consigas un lugar.'
      },    
      {
        element: '#home',
        title: 'Ir al inicio',
        content: 'Clic en el logo de Learny y regresarás siempre a esta página',
        placement: 'bottom'
      }    
    ]});
// Initialize the tour
tour.init();
// Start the tour
tour.start();