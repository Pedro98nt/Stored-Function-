-- Incluir Dados
INSERT INTO aluno (nome) VALUES ('Renato Soares');
INSERT INTO aluno (nome) VALUES ('Aline Fernandes');
INSERT INTO aluno (nome) VALUES ('Roberta Silva');
INSERT INTO aluno (nome) VALUES ('Luana do Carmo');
INSERT INTO aluno (nome) VALUES ('Renato Fernandes');
-- Função 01
CREATE OR REPLACE FUNCTION
 sf_calcula_media_final(idAluno INTEGER, n1 FLOAT, n2 FLOAT)
RETURNS VOID AS $$
DECLARE
BEGIN
 UPDATE aluno SET nota_n1=n1, nota_n2=n2, nota_media_final = (n1 *
0.40 + n2 * 0.60) WHERE id = idAluno;
END;
$$ LANGUAGE plpgsql;
SELECT sf_calcula_media_final(1, 10, 10);
SELECT * FROM aluno
-- Função 02
CREATE OR REPLACE FUNCTION
sf_calcula_media_final_situacao(idAluno
INTEGER, n1 FLOAT, n2 FLOAT)
RETURNS VARCHAR AS $$
DECLARE
 notaGeral FLOAT := (n1 * 0.40 + n2 * 0.60);
 resultado VARCHAR := '';
BEGIN
 UPDATE aluno SET nota_n1=n1, nota_n2=n2, nota_media_final =
notaGeral WHERE id = idAluno;

 IF (notaGeral < 7) THEN
 resultado := 'Fazer N3 e Tirar Nota >= ' || (10 - notaGeral) ||
' Boa Sorte :(';
 ELSE
 resultado := 'Você Passou Sem N3. Parabéns :) !!!';
 END IF;
 RETURN resultado;
END;
$$ LANGUAGE plpgsql;
SELECT sf_calcula_media_final_situacao(1, 2, 1);
--