pkg_lst <- c(
  "knitr",
  "readODS",
  "dplyr",
  "flextable",
  "officedown",
  "officer"
)

lapply(
  pkg_lst,
  library,
  character.only = TRUE
)

# Officedown部份
# 指定一個會加入到tab這個seq_id的run動作
runs_tab <- run_autonum(
    seq_id = "tab",
    pre_label = "",
    post_label = ""
)

# 指定一個會加入到fig這個seq_id的run動作
runs_fig <- run_autonum(
    seq_id = "fig",
    pre_label = "",
    post_label = ""
)

# 指定一個會加入到ref這個seq_id的run動作
runs_ref <- run_autonum(
    seq_id = "ref",
    pre_label = "",
    post_label = ""
)

# Flextable部份
theme_ms <- function(x) {
  x <-
    # 以theme_box為基礎
    theme_box(x) %>%
    # header背景顏色
    bg(
      part = "header",
      bg = "#4F81BD"
    ) %>%
    # header外圍框線顏色&寬度
    border_outer(
      part = "header",
      border = fp_border(
        color = "#4F81BD",
        width = 1
      )
    ) %>%
    # header內側橫向框線顏色&寬度
    border_inner(
      part = "header",
      border = fp_border(
        color = "white",
        width = 1
      )
    ) %>%
    # body框線顏色&寬度
    border(
      part = "body",
      border = fp_border(
        color = "#4F81BD",
        width = 1
      )
    ) %>%
    # header文字顏色
    color(
      part = "header",
      color = "white"
    )

  return(x)
}

theme_cer <- function(x) {
  x <-
    # 以theme_box為基礎
    theme_box(x) %>%
    # header背景顏色
    bg(
      part = "header",
      bg = "#BDC0BA"
    ) %>%
    # header外圍框線顏色&寬度
    border_outer(
      part = "header",
      border = fp_border(
        color = "#000000",
        width = 1
      )
    ) %>%
    # header內側橫向框線顏色&寬度
    border_inner(
      part = "header",
      border = fp_border(
        color = "#000000",
        width = 1
      )
    ) %>%
    # body框線顏色&寬度
    border(
      part = "body",
      border = fp_border(
        color = "#000000",
        width = 1
      )
    ) %>%
    # header文字顏色
    color(
      part = "header",
      color = "#000000"
    )

  return(x)
}

# 多數情況
set_flextable_defaults(
  font.family = "Times New Roman",
  eastasia.family = "DFKai-SB",
  theme_fun = "theme_ms"
)

# # for CER
# set_flextable_defaults(
#   font.family = "Cambria",
#   eastasia.family = "DFKai-SB",
#   theme_fun = "theme_cer"
# )

# 定義常用文字格式
ft_red <- fp_text_lite(color = "red")
ft_blue <- fp_text_lite(color = "#005CAF")
ft_bold <- fp_text_lite(bold = TRUE)
fp_underline <- fp_text_lite(underlined = TRUE)

# 依照可視寬度等比例換算欄位寬度
width_ratio <- function(
  x,
  width_col_ratio,
  width_visible = 7
) {
  result <-
    width_col_ratio * width_visible / sum(width_col_ratio)
  
  width(
    x = x,
    width = result
  )
}
