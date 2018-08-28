class Course < ApplicationRecord
  #Los cursos pueden tener muchos materiales y que cuando se elimine el curso, también se eliminen los materiales.
  #Tambén nos da la habilidad de acceder a los materiaels desde el curso
  has_many :materials, dependent: :delete_all

end
