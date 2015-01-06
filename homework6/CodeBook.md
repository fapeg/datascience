Codebook zur Datenanalyse
=========================

Die Trainings- und die Testdaten müssen in ein Dataframe gemerget werden. Dazu kommen außerdem die **activity\_labels** (WALKING, LAYING, etc.), die in einer eigenen Datei abgelegt sind. Die Namen dieser Labels werden in **feature\_names** gespeichert.

Ich habe eine Funktion **rd** geschrieben, der man Variablen- und Dateinamen übergibt. Die Funktion speichert das Dataframe daraufhin in den entsprechenden Variablennamen. (**testdata, traindata, test\_subject\_id, test\_activity\_id, train\_subject\_id, train\_activity\_id**)

In **test\_data** und **train\_data** werden die ID des Probanden, die ID der Aktivität und die eigentlichen Daten miteinander verbunden.

Danach werden die Trainingsdaten, die etwa 70% ausmachen mit den restlichen 30% Testdaten zusammengefügt in **all\_data**.

Wir brauchen nur die Spalten mit Standard- bzw. Durchschnittsabweichung, deshalb wird ein **grep** auf **std** oder **mean** durchgeführt.

Die Namen dieser Spalten, wie etwa *tBodyAcc-mean()-Z* werden in **ms_col_names** gespeichert. In **msdata** wird der komplette Datensatz gespeichert, er kommt aus **all_data** aber es werden nur die Spalte, die in **ms\_col\_names** stehen übernommen.

In **descrnames** werden die **activity\_labels** zum Datensatz hinzugefügt, die anhand der **activity\_id** ausgewählt werden.

In den nächsten zwei Schritten werden mit **melt** und **dcast** aus dem **reshape2**-Paket die drei Spaltenüberschriften **activity\_id**, **activity\_name** und **subject\_id** hinzugefügt. Der so verschmolzene Datensatz wird danach in **mean\_data** gecastet.

Die letzte Zeile schreibt den so entstandenen Datensatz **mean\_data** in die Datei **tidy\_data.txt**.