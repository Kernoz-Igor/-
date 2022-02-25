FROM centos
COPY Lab1.sh .
RUN chmod ugo+x Lab1.sh
RUN touch /tmp/Doc1.odt && touch /tmp/Doc2.odt
CMD ./Lab1.sh
