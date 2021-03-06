


`%>%` <- magrittr:: `%>%`


# Gráfico do PIB Trimestral (Sem ajuste sazonal) ------------------------------------------------------------------------


pib <- sidrar::get_sidra(api = '/t/1620/n1/all/v/all/p/all/c11255/90707',

                         period = as.Date('2020-04-01')) %>%

  janitor::clean_names() %>%

  dplyr::mutate(date = zoo::as.yearqtr(trimestre_codigo, format = '%Y %q')) %>%

  dplyr::select(date, valor)


pib %>%

  ggplot2::ggplot() +

  ggplot2::geom_line(mapping = ggplot2::aes(x = date, y = valor),

                     size = 1, colour = '#126244') +

  ggplot2::geom_point(mapping = ggplot2::aes(x = date, y = valor),

                      colour = '#126244') +

  ggplot2::labs(title = '**Produto Interno Bruto** (Brasil)',

                x = '**Trimestres**',

                y = '**Número Índice** (Base: media de 1995 = 100)',

                caption = '**Dados**: IBGE.') +

  zoo::scale_x_yearqtr(n = 24, format = '%Y') +

  ggplot2::theme(axis.title.x = ggtext::element_markdown(),

                 axis.title.y = ggtext::element_markdown(),

                 plot.title = ggtext::element_markdown(),

                 plot.caption = ggtext::element_markdown())


#---------------------------------------------------------------------------------------------------


# Gráfico do PIB Trimestral (com ajuste sazonal) ---------------------------------------------------


pib_sa <- sidrar::get_sidra(api = '/t/1621/n1/all/v/all/p/all/c11255/90707',

                         period = as.Date('2020-04-01')) %>%

  janitor::clean_names() %>%

  dplyr::mutate(date = zoo::as.yearqtr(trimestre_codigo, format = '%Y %q')) %>%

  dplyr::select(date, valor)




pib_sa %>%

  ggplot2::ggplot() +

  ggplot2::geom_line(mapping = ggplot2::aes(x = date, y = valor),

                     size = 1, colour = '#126244') +

  ggplot2::geom_point(mapping = ggplot2::aes(x = date, y = valor),

                      colour = '#126244') +

  ggplot2::labs(title = '**Produto Interno Bruto** (Brasil)',

                subtitle = 'Série com Ajuste Sazonal',

                x = '**Trimestres**',

                y = '**Número Índice** (Base: media de 1995 = 100)',

                caption = '**Dados**: IBGE.') +

  ggplot2::ylim(95, 180) +

  zoo::scale_x_yearqtr(n = 24, format = '%Y') +

  ggplot2::theme(axis.title.x = ggtext::element_markdown(),

                 axis.title.y = ggtext::element_markdown()) +

  ggplot2::annotate(geom = 'rect',

           xmin = zoo::as.yearqtr('200803', format = '%Y %q'),

           xmax = zoo::as.yearqtr('200901', format = '%Y %q'),

           ymin = 95, ymax = 180,

           fill = '#951126', alpha = 0.35) +

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('200101', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('200104', format = '%Y %q'),

                    ymin = 95, ymax = 180,

                    fill = '#951126', alpha = 0.35) +

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('200204', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('200302', format = '%Y %q'),

                    ymin = 95, ymax = 180,

                    fill = '#951126', alpha = 0.35) +

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('201403', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('201604', format = '%Y %q'),

                    ymin = 95, ymax = 180,

                    fill = '#951126', alpha = 0.35) +

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('201902', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('202002', format = '%Y %q'),

                    ymin = 95, ymax = 180,

                    fill = '#951126', alpha = 0.35) +

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('200104', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('200203', format = '%Y %q'),

                    ymin = 95, ymax = 180,

                    fill = '#354171', alpha = 0.35) +

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('200302', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('200401', format = '%Y %q'),

                    ymin = 95, ymax = 180,

                    fill = '#354171', alpha = 0.35)+

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('200901', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('200904', format = '%Y %q'),

                    ymin = 95, ymax = 180,

                    fill = '#354171', alpha = 0.35)+

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('201604', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('201703', format = '%Y %q'),

                    ymin = 95, ymax = 180,

                    fill = '#354171', alpha = 0.35) +

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('202002', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('202004', format = '%Y %q'),

                    ymin = 95, ymax = 180,

                    fill = '#354171', alpha = 0.35) +

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('199901', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('200004', format = '%Y %q'),

                    ymin = 95, ymax = 180,

                    fill = '#9CCD96', alpha = 0.35) +

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('200503', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('200802', format = '%Y %q'),

                    ymin = 95, ymax = 180,

                    fill = '#9CCD96', alpha = 0.35)


#---------------------------------------------------------------------------------------------------


# Gráfico do Nível de Ocupação e PIB (com ajuste sazonal) --------------------------------------------


nivel_ocupacao <- sidrar::get_sidra(api = '/t/4093/n1/all/v/4097/p/all/c2/6794/d/v4097%201',

                  period = as.Date('2020-04-01')) %>%

  janitor::clean_names() %>%

  dplyr::mutate(date = zoo::as.yearqtr(trimestre_codigo, format = '%Y %q'),

                valor = valor/100) %>%

  dplyr::select(date, valor)


no <- nivel_ocupacao %>%

  ggplot2::ggplot() +

  ggplot2::geom_line(mapping = ggplot2::aes(x = date, y = valor),

                     size = 1, colour = '#126244') +

  ggplot2::geom_point(mapping = ggplot2::aes(x = date, y = valor),

                      colour = '#126244') +

  ggplot2::labs(title = '**Taxa de Ocupação** ',

                subtitle = 'Proporção ocupada da população em idade de trabalhar',

                x = '**Trimestres**',

                y = '**Porcentagem**',

                caption = '**Dados**: IBGE.') +

  zoo::scale_x_yearqtr(n = 10, format = '%Y') +

  ggplot2::scale_y_continuous(labels = scales::percent_format(suffix = '%', decimal.mark = ',')) +

  ggplot2::theme(axis.title.x = ggtext::element_markdown(),

                 axis.title.y = ggtext::element_markdown(),

                 plot.title = ggtext::element_markdown(),

                 plot.caption = ggtext::element_markdown()) +

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('201501', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('201701', format = '%Y %q'),

                    ymin = min(nivel_ocupacao$valor), ymax = max(nivel_ocupacao$valor),

                    fill = 'red', alpha = 0.2) +

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('201904', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('202003', format = '%Y %q'),

                    ymin = max(nivel_ocupacao$valor), ymax = min(nivel_ocupacao$valor),

                    fill = 'red', alpha = 0.2)



pib <- pib_sa %>%

  dplyr::filter(date >= zoo::as.yearqtr('201201', format = '%Y %q')) %>%

  ggplot2::ggplot() +

  ggplot2::geom_line(mapping = ggplot2::aes(x = date, y = valor),

                     size = 1, colour = '#126244') +

  ggplot2::geom_point(mapping = ggplot2::aes(x = date, y = valor),

                      colour = '#126244') +

  ggplot2::labs(title = '**Produto Interno Bruto** (Brasil)',

                subtitle = 'Série com Ajuste Sazonal',

                x = '**Trimestres**',

                y = '**Número Índice** (Base: media de 1995 = 100)',

                caption = '**Dados**: IBGE.') +

  ggplot2::ylim(95, 180) +

  zoo::scale_x_yearqtr(n = 10, format = '%Y') +

  ggplot2::theme(axis.title.x = ggtext::element_markdown(),

                 axis.title.y = ggtext::element_markdown(),

                 plot.title = ggtext::element_markdown(),

                 plot.caption = ggtext::element_markdown()) +

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('201501', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('201604', format = '%Y %q'),

                    ymin = min(pib_sa$valor), ymax = max(pib_sa$valor),

                    fill = 'red', alpha = 0.2) +

  ggplot2::annotate(geom = 'rect',

                    xmin = zoo::as.yearqtr('201904', format = '%Y %q'),

                    xmax = zoo::as.yearqtr('202002', format = '%Y %q'),

                    ymin = min(pib_sa$valor), ymax = max(pib_sa$valor),

                    fill = 'red', alpha = 0.2)


gridExtra::grid.arrange(pib, no, nrow = 2)


#---------------------------------------------------------------------------------------------------


# Agregados Macroeconômicos (sem ajuste sazonal) ----------------------------------------------------


agregados_macroeconomicos <- sidrar::get_sidra(api = '/t/1620/n1/all/v/all/p/all/c11255/90707,93404,93405,93406,93407,93408/d/v583%202',

                                               period = as.Date('2020-04-01')) %>%

  janitor::clean_names() %>%

  dplyr::mutate(date = zoo::as.yearqtr(trimestre_codigo, format = '%Y %q')) %>%

  dplyr::select(date, valor, setores_e_subsetores) %>%

  dplyr::mutate(setores_e_subsetores = dplyr::case_when(setores_e_subsetores == 'PIB a preços de mercado' ~ 'PIB a preços de mercado - PIB (Y)',

                                                       setores_e_subsetores == 'Despesa de consumo das famílias' ~ 'Despesa de consumo das famílias - Consumo das Famílias (C)',

                                                       setores_e_subsetores == 'Formação bruta de capital fixo' ~ 'Formação bruta de capital fixo - Investimento Privado (I)',

                                                       setores_e_subsetores == 'Despesa de consumo da administração pública' ~ 'Despesa de consumo da administração pública - Gastos do Governo (G)',

                                                       setores_e_subsetores == 'Exportação de bens e serviços' ~ 'Exportação de bens e serviços - Exportações (X)',

                                                       setores_e_subsetores == 'Importação de bens e serviços (-)' ~ 'Importação de bens e serviços - Importações (M)')) %>%

  tibble::view()


agregados_macroeconomicos %>%

  ggplot2::ggplot() +

  ggplot2::geom_line(mapping = ggplot2::aes(x = date, y = valor),

                     colour = '#126244',

                     size = 1) +

  ggplot2::geom_point(mapping = ggplot2::aes(x = date, y = valor),

                      colour = '#126244') +

  ggplot2::facet_wrap(~ setores_e_subsetores) +

  ggplot2::scale_x_continuous(breaks = seq(1996,2020, 2)) +

  ggplot2::labs(title = 'Agregados Macroeconômicos (Brasil)',

                x = '**Trimestres**',

                y = '**Número Índice** (Base: media de 1995 = 100)',

                caption = '**Dados**: IBGE.') +

  ggplot2::theme(axis.title.x = ggtext::element_markdown(),

                 axis.title.y = ggtext::element_markdown(),

                 plot.title = ggtext::element_markdown(),

                 plot.caption = ggtext::element_markdown(),

                 legend.position = 'bottom')


# --------------------------------------------------------------------------------------------------


# Agregados Macroeconômicos (com ajuste sazonal) ----------------------------------------------------


agregados_macroeconomicos <- sidrar::get_sidra(api = '/t/1621/n1/all/v/all/p/all/c11255/90707,93404,93405,93406,93407,93408/d/v584%202',

                                               period = as.Date('2020-04-01')) %>%

  janitor::clean_names() %>%

  dplyr::mutate(date = zoo::as.yearqtr(trimestre_codigo, format = '%Y %q')) %>%

  dplyr::select(date, valor, setores_e_subsetores) %>%

  dplyr::mutate(setores_e_subsetores = dplyr::case_when(setores_e_subsetores == 'PIB a preços de mercado' ~ 'PIB a preços de mercado (Y)',

                                                        setores_e_subsetores == 'Despesa de consumo das famílias' ~ 'Consumo das Famílias (C)',

                                                        setores_e_subsetores == 'Formação bruta de capital fixo' ~ 'Investimento Privado (I)',

                                                        setores_e_subsetores == 'Despesa de consumo da administração pública' ~ 'Gastos do Governo (G)',

                                                        setores_e_subsetores == 'Exportação de bens e serviços' ~ 'Exportações (X)',

                                                        setores_e_subsetores == 'Importação de bens e serviços (-)' ~ 'Importações (M)')) %>%



  tibble::view()


agregados_macroeconomicos %>%

  dplyr::filter(date > zoo::as.yearqtr(2004, Q1)) %>%

  ggplot2::ggplot() +

  ggplot2::geom_line(mapping = ggplot2::aes(x = date, y = valor),

                     colour = '#126244',

                     size = 1) +

  ggplot2::geom_point(mapping = ggplot2::aes(x = date, y = valor),

                      colour = '#126244') +

  ggplot2::facet_wrap(~ setores_e_subsetores) +

  ggplot2::scale_x_continuous(breaks = seq(1996,2020, 2)) +

  ggplot2::labs(title = 'Agregados Macroeconômicos (Brasil)',

                subtitle = 'Série com Ajuste Sazonal',

                x = '**Trimestres**',

                y = '**Número Índice** (Base: media de 1995 = 100)',

                caption = '**Dados**: IBGE.') +

  ggplot2::theme(axis.title.x = ggtext::element_markdown(),

                 axis.title.y = ggtext::element_markdown(),

                 plot.title = ggtext::element_markdown(),

                 plot.caption = ggtext::element_markdown(),

                 legend.position = 'bottom')


# --------------------------------------------------------------------------------------------------


# Agregados Macroeconômicos (preços de mercado) ----------------------------------------------------

agregados_macroeconomicos <- sidrar::get_sidra(api = '/t/2072/n1/all/v/933,936,938/p/all',

                                               period = as.Date('2020-04-01')) %>%

  janitor::clean_names() %>%

  dplyr::mutate(date = zoo::as.yearqtr(trimestre_codigo, format = '%Y %q')) %>%

  dplyr::select(date, valor, variavel) %>%

  dplyr::filter(variavel != '(=) Renda nacional disponível bruta') %>%

  dplyr::mutate(variavel = dplyr::case_when(variavel == 'Produto Interno Bruto' ~ 'Produto Interno Bruto - PIB (Y)',

                                            variavel == '(=) Renda nacional bruta' ~ 'Renda nacional disponível bruta - RNB')) %>%

  tibble::view()



agregados_macroeconomicos %>%

  dplyr::filter(variavel == 'Produto Interno Bruto - PIB (Y)') %>%

  ggplot2::ggplot() +

  ggplot2::geom_line(mapping = ggplot2::aes(x = date, y = valor),

                     colour = '#126244',

                     size = 1) +

  ggplot2::geom_point(mapping = ggplot2::aes(x = date, y = valor),

                      colour = '#126244') +

  ggplot2::scale_x_continuous(breaks = seq(1996,2020, 2)) +

  ggplot2::scale_y_continuous(labels = scales::dollar_format(prefix = 'R$ ', big.mark = '.')) +

  ggplot2::labs(title = 'Produto Interno Bruto - PIB Y',

                subtitle = 'Preços de Mercado',

                x = '**Trimestres**',

                y = '**Milhões de Reais**',

                caption = '**Dados**: IBGE.') +

  ggplot2::theme(axis.title.x = ggtext::element_markdown(),

                 axis.title.y = ggtext::element_markdown(),

                 plot.title = ggtext::element_markdown(),

                 plot.caption = ggtext::element_markdown(),

                 legend.position = 'bottom')

# agregados_macroeconomicos %>%
#
#   dplyr::filter(variavel == 'Produto Interno Bruto - PIB (Y)') %>%
#
#   ggplot2::ggplot() +
#
#   ggplot2::geom_line(mapping = ggplot2::aes(x = date, y = valor),
#
#                      colour = '#126244',
#
#                      size = 1) +
#
#   ggplot2::geom_point(mapping = ggplot2::aes(x = date, y = valor),
#
#                       colour = '#126244') +
#
#   ggplot2::facet_wrap(~ setores_e_subsetores) +
#
#   ggplot2::scale_x_continuous(breaks = seq(1996,2020, 2)) +
#
#   ggplot2::labs(title = 'Agregados Macroeconômicos (Brasil)',
#
#                 subtitle = 'Série com Ajuste Sazonal',
#
#                 x = '**Trimestres**',
#
#                 y = '**Número Índice** (Base: media de 1995 = 100)',
#
#                 caption = '**Dados**: IBGE.') +
#
#   ggplot2::theme(axis.title.x = ggtext::element_markdown(),
#
#                  axis.title.y = ggtext::element_markdown(),
#
#                  plot.title = ggtext::element_markdown(),
#
#                  plot.caption = ggtext::element_markdown(),
#
#                  legend.position = 'bottom')

