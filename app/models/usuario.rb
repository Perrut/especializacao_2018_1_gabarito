class Usuario < ApplicationRecord
  has_secure_password
  
  has_many :posts, dependent: :destroy
  
  validates :nome, presence: true, length: { in: 2..20 }
  validates :sobrenome, presence: true, length: { in: 2..80 }
  validates :email, presence: true, length: { in: 5..40 }, uniqueness: true
  validates :telefone, presence: true, length: { in: 8..14 }
  validates :data_nascimento, presence: true
  validates :password, length: { in: 6..12 }, allow_nil: true
  validate :data_correta
  
  def data_correta
    if data_nascimento > (DateTime.now - 18.years)
      errors.add(:data_nascimento, "inválida, apenas para maiores de 18 anos.")
    elsif data_nascimento < (DateTime.now - 200.years)
      errors.add(:data_nascimento, "inválida.")
    end
  end
end
