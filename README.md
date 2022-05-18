### BACK-END-API
Projeto para Back:

<pre>
Objetivo:
O projeto simula o fluxo de um sistema de coleta em campo, essa coleta engloba basicamente as entidades:
• Usuário: que identifica e autentica a pessoa no sistema para que ela saiba quais visitas
existem direcionadas a ela.
• Visita: que consiste numa tarefa com uma data agendada, e possui informações como,
data de checkin e checkout e usuário responsável por aquela visita.
• Formulários: são questionários que englobam várias perguntas específicas de algum
assunto.
• Perguntas: é autoexplicativo, são as perguntas de um formulário.
• Respostas: são as respostas das perguntas.


Modelos:

USER - API com micro-serviços de criação, edição e listagem de usuários.
Campos:
 • Nome
 • Senha
 • E-mail
 • CPF
Validações de campos:
 • Senha maior que seis dígitos variando entre números e letras
 • E-mail não pode ser repetido
 • CPF não pode ser repetido
 • Checar se o CPF é válido
 
VISIT - API com micro-serviços de criação, edição e listagem de VISITAS.
Campos:
 • Data
 • Status (PENDENTE, REALIZANDO, REALIZADA)
 • user_id
 • checkin_at (tipo do campo: Datetime)
 • checkout_at (tipo do campo: Datetime)
Validações de campos:
 • Data tem que ser maior ou igual que a data atual de criação da visita.
 • Checkin-at não pode ser maior ou igual que o dia atual, e menor que a data de checkout.
 • Checkout-at precisa ser maior que o checkin-at.
 • Checar se o user_id é um usuário válido.
 
FORMULARY - API com micro-serviços de criação, edição e listagem de formulários.
Campos:
 • Nome Validação de campos:
 • Nome não pode ser repetido.
 
QUESTION - API com micro-serviços de criação, edição e listagem de questions.
Campos:
 • Nome
 • formulary_id
 • Tipo de pergunta
 
ANSWER 
Campos:
 • content
 • formulary_id
 • question_id
 • visit_id
 • answered_at
</pre>
