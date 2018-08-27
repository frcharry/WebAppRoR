#Archivo de configuración de test, permite decirle a la app un comportamiento para realizar una prueba específica.

require "rails_helper" #Solicita una librería
RSpec.feature "Admins pueden crear proyectos" do #Describe una característica a probar
  scenario "con atributos válidos" do #determina el escenario donde la prueba se ejecuta con datos correctos.
    visit "/" #El usuario visita la página principal
    click_link "Nuevo Curso" #Da click en un link que se llama "Nuevo curso"
    fill_in "Name", with: "Matemáticas"#Llena los datos para un curso de matemáticas
    fill_in "Description", with:"Es un curso de matemáticas básicas"
    click_button "Guardar"#Da click en guardar
    expect(page).to have_content "Se ha creado el curso." #El sistema devuelve el mensaje con que el curso se ha creado correctamente. El mensaje tiene que ser exacto con el del controller
  end
end
