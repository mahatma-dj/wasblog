# age
str(was5_per$DVAge9W5)
was5_per$z_DVAge9W5 <- factor(was5_per$DVAge9W5)
levels(was5_per$z_DVAge9W5) = c("0-15","16-24","25-34","35-44","45-54","55-64","65-74","75-84","85+")
str(was5_per$z_DVAge9W5)
table(was5_per$z_DVAge9W5, useNA = "always")
pal <- wes_palette("Zissou1")
ageplot <- ggplot(subset(was5_per,!is.na(z_DVAge9W5)), aes(z_DVAge9W5, label = z_DVAge9W5)) +
  geom_bar(fill = pal[2]) +
  xlab("Age group") +
  ylab("Number of participants") +
  theme_minimal() + 
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        text = element_text(color = "grey50"),
        axis.text.x = element_text(size = 8,angle = 45) )


# SEC
str(was5_per$NSSEC5W5)
was5_per$z_NSSEC5W5 <- factor(was5_per$NSSEC5W5)
levels(was5_per$z_NSSEC5W5)
# set NA values
was5_per$z_NSSEC5W5[was5_per$z_NSSEC5W5 == -7] <- NA
table(was5_per$z_NSSEC5W5)
was5_per$z_NSSEC5W5 <- droplevels(was5_per$z_NSSEC5W5)
# set level names
levels(was5_per$z_NSSEC5W5) <- c("Managerial and professional occupations",
                                 "Intermediate occupations",
                                 "Small employers and own account workers",
                                 "Lower supervisory and technical occupations",
                                 "Semi-routine or routine occupations",
                                 "Never worked and long-term unemployed",
                                 "Not classified")
# plot it
breaks <- str_wrap(c("Managerial and professional occupations",
             "Intermediate occupations",
             "Small employers and own account workers",
             "Lower supervisory and technical occupations",
             "Semi-routine or routine occupations",
             "Never worked and long-term unemployed",
             "Not classified"),17)
pal_cont <- wes_palette("Zissou1", 7, type = "continuous")
secplot <- ggplot(subset(was5_per,!is.na(z_NSSEC5W5)), aes(z_NSSEC5W5, fill=str_wrap(z_NSSEC5W5,17))) +
  geom_bar() + 
  scale_fill_manual(values = pal_cont, breaks=breaks, guide = guide_legend(ncol = 2)) +
  scale_y_continuous(breaks = c(2000,4000,6000,8000,10000,12000,14000)) +
  xlab("Socio-Economic Classification") +
  ylab("Number of participants") +
  theme_minimal() + 
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.text.x = element_blank(),
        legend.position = "left",
        legend.text = element_text(size = 7, color="grey50"),
        legend.title = element_blank(),
        legend.key.height = unit(1.8,"lines"),
        legend.key.width = unit(0.8,"lines"),
        text = element_text(color = "grey50"))
#get legend
sec_legend <- get_legend(secplot)

# marital status
str(was5_per$marstw5)
was5_per$z_marstw5 <- factor(was5_per$marstw5)
was5_per$z_marstw5[was5_per$z_marstw5 == 0] <- NA
was5_per$z_marstw5 <- droplevels(was5_per$z_marstw5)
levels(was5_per$z_marstw5) <- c("Married","Cohabiting","Single","Widowed","Divorced","Separated")
table(was5_per$z_marstw5)
# plot
marplot <- ggplot(subset(was5_per,!is.na(z_marstw5)), aes(z_marstw5)) +
  geom_bar(fill=pal[5])+
  xlab("Marital status") +
  ylab("Number of participants") +
  theme_minimal() + 
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        text = element_text(color = "grey50"),
        axis.text.x = element_text(size = 8,angle = 45))

#combined plot
plot_grid(ageplot + theme(axis.text.x = element_text(hjust = 1, vjust = 1,margin = margin(t=-6))), 
          marplot + theme(axis.text.x = element_text(hjust = 1, vjust = 1,margin = margin(t=-5))) + geom_text(stat='count',aes(label=..count..), angle=90, color='white'),
          secplot + theme(legend.position='none', axis.title.x = element_text(hjust = 2)), 
          sec_legend)