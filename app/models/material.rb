class Material < ApplicationRecord
  #ES necesario decir que el material pertenece al curso
  belongs_to :course
end
