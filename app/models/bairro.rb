# encoding: utf-8
#
# CAMPO        | DESCRIÇÃO DO CAMPO                                   | DESCRIÇÃO TIPO
# BAI_NU       | chave do Bairro                                      | NUMBER(8)
# UFE_SG       | sigla da UF                                          | CHAR(2)
# LOC_NU       | chave da localidade                                  | NUMBER(8)
# BAI_NO       | nome do Bairro                                       | VARCHAR2(72)
# BAI_NO_ABREV | abreviatura do nome do bairro (opcional)             | VARCHAR2(36)
# BAI_OPERACAO | Operação: DEL = Delete, INS  = Insert, UPD = Update. | CHAR(3)

require "csv"

class Bairro
  @@column_names = %w(bai_nu ufe_sg loc_nu bai_no bai_no_abrev bai_operacao)

  @@column_names.each {|name| attr_accessor name}

  def initialize row
    fill! row
  end

  def self.parse file_name="DELTA_LOG_BAIRRO.TXT"
    bairros = []
    CSV.foreach(file_name, col_sep: "@", encoding: "ISO-8859-1") do |row|
      bairros.push Bairro.new row
    end
    bairros
  end

  def fill! row
    @@column_names.each_with_index do |name, index|
      public_send "#{name}=", row[index]
    end
  end

  def to_s
    @@column_names.collect {|name| public_send name }.join "@"
  end
end
