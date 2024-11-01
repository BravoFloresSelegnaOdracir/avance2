function showContent(sectionId) {
    // Ocultar todas las secciones
    var sections = document.querySelectorAll('.section');
    sections.forEach(function(section) {
        section.classList.remove('active');
    });

    // Mostrar solo la sección seleccionada
    var selectedSection = document.getElementById(sectionId);
    selectedSection.classList.add('active');
}