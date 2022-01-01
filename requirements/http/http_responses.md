# HTTP

> # Sucesso

1. Request com verbo http válido(post) - Válidado
2. Passar nos headers o content type JSON - Válidado
3. Chamar request com body correto - Válidado
4. Ok - 200 e resposta com dados - Válidado
5. No content - 204 e resposta sem dados - Válidado

> # Erros

1. Bad Request - 400 - Válidado
2. Unauthorized - 401 - Válidado
3. Forbidden - 403 - Válidado
4. Not found - 404
5. Internal server error - 500 - Válidado

> # Exceção - Status code diferente dos citados acima

1. Internal server error - 500 - Válidado

> # Exceção - Http request deu alguma exceção

1. Internal server error - 500

> # Exceção - Verbo http inválido

1. Internal server error - 500
