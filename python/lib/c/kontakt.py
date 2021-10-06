#!/usr/bin/env python3

# class Kontakt
#
# k1 = Kontakt(vorname, nachname, email, mobile, adresse, plz, ort, geburtstag)
# k1 = output()
#


class Kontakt():

    def __init__(self, vorname, nachname, email, mobile, adresse, plz, ort, geburtstag):
        self.Vorname = vorname
        self.Nachname = nachname
        self.Email = email
        self.Mobile = mobile
        self.Adresse = adresse
        self.PLZ = plz
        self.Ort = ort
        self.Geburtstag = geburtstag
        
    def output(self):
        print("Vorname: " + self.Vorname)
        print("Nachname: " + self.Nachname)
        print("Email: " + self.Email)
        print("Mobile: " + self.Mobile)
        print("Adresse: " + self.Adresse)
        print("PLZ: " + self.PLZ)
        print("Ort: " + self.Ort)
        print("Geburtstag: " + self.Geburtstag)



# END

#


        
