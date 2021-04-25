




#' Encontrar o pior ano com menor numeros de vitorias de um time na serie historica.
#'
#' @param time Nome de um time ('Cruzeiro' por padrao)
#'
#' @return Uma tibble com tres colunas
#' @export
#'
#' @examples
#'
#' encontrar_pior_ano_time('Fortaleza')

encontrar_pior_ano_time <- function(time){

  "https://git.io/JOqUN" %>%
    readr::read_csv2() %>%
    dplyr::group_by(temporada, quem_ganhou) %>%
    dplyr::filter(quem_ganhou != "Empate", quem_ganhou %in% time) %>%
    dplyr::count(quem_ganhou, sort = TRUE, name = "n_vitorias") %>%
    dplyr::ungroup() %>%
    dplyr::filter(n_vitorias == base::min(n_vitorias, na.rm = T)) %>%
    dplyr::rename(time = quem_ganhou)
}
