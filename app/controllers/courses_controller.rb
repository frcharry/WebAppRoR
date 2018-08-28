# El controlador lo utilzamos para definir las operaciones CRUD, la vista general "Index", la Vista particular "Show".
class CoursesController < ApplicationController
  def index #Muestra todos los registros // GET
    @courses = Course.all #asigna todos los cursos que han sido creados
  end
  def new #Devuelve una forma a través de la cual podemos crear el objeto // GET
    @course = Course.new #Variable con '@' de alcance global, se puede llamar desde la vista.
  end
  def create  #Creamos un objeto // POST
    @course = Course.new(course_params) #vamos a trabajar con una instancia de Course
    if @course.save #Si el curso se guarda correctamente
      flash[:notice]="Se ha creado el curso." #Desplega mensaje en notificación
      redirect_to @course #Vuelve a Show
    else #Si falta algún dato.
      flash[:error]="No se ha creado el curso"#Desplega error
      render action:"new"
    end
  end
  def show #Muestra un objeto // GET
    @course=Course.find(params[:id]) #indicamos que queremos encontrar el curso con el id que estamos enviando en nuestros parámetros
  end
  def edit #Devuelve una forma a través de la cual podemos modificar el objeto // GET
    @course=Course.find(params[:id])
  end
  def update # Modofica el objeto // PATCH, PUT
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:notice] = "Se ha actualizado el curso."
      redirect_to @course
    else
      flash[:error]="No se ha actualizado el curso"
      render action: "edit" #vuelve a mostrar la forma
    end
  end
  def destroy # Elimina el objeto // DELETE
    @course=Course.find(params[:id])
    @course.destroy
    flash[:notice]="El curso se ha eliminado."
    redirect_to courses_path
  end
  private
    def course_params #los únicos parámetros que se van a guardar son el nombre y la descripción, al restringir los datos se cierra la vulnerabilidad de exponer todos los parámetros del objeto.
      params.require(:course).permit(:name,:description)
    end
end
