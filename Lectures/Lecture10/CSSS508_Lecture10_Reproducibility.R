library(tidyverse)
library(pander)
library(knitr)

ex_dat <- data.frame(num1 = rnorm(200, 1, 2), 
                     fac1 = sample(c(1, 2, 3), 200, TRUE),
                     num2 = rnorm(200, 0, 3),
                     fac2 = sample(c(1, 2))) %>%
  mutate(yn = num1*0.5 + fac1*1.1 + num2*0.7 + fac2-1.5  + rnorm(200, 0, 2)) %>% 
  mutate(yb = as.numeric(yn > mean(yn))) %>%
  mutate(fac1 = factor(fac1, labels=c("A", "B", "C")),
         fac2 = factor(fac2, labels=c("Yes", "No")))

library(broom)

lm_1 <- lm(yn ~ num1 + fac1, data = ex_dat)
summary(lm_1)
  
glm_1 <- glm(yb ~ num1 + fac1, data = ex_dat, family=binomial(link="logit"))
summary(glm_1)

lm_1 %>% tidy()

glm_1 %>% tidy()

glance(lm_1)

augment(lm_1) %>% head()

library(gapminder)
ggplot(data = gapminder, 
       aes(x = year, y = lifeExp, color = continent)) +
  geom_point(position = position_jitter(1,0), size = 0.5) +
  geom_smooth()

ggplot(data = gapminder, 
       aes(x = year, y = lifeExp, color = continent)) +
  geom_point(position = position_jitter(1,0), size = 0.5) +
  geom_smooth(method = "glm", formula = y ~ x) #<<

ggplot(data = gapminder, 
       aes(x = year, y = lifeExp, color = continent)) +
  geom_point(position = position_jitter(1,0), size = 0.5) +
  geom_smooth(method = "glm", formula = y ~ poly(x, 2)) #<<

library(pander)
panderOptions("table.style", "rmarkdown")

pander(lm_1)

pander(summary(lm_1))


library(corrplot)
corrplot(cor(mtcars), addCoef.col = "white", addCoefasPercent=T, type="upper", order="FPC")
