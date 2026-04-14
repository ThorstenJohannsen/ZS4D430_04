extend view entity Z04_C_EMPLOYEEQUERYP with 
// Ü19 Aufgabe 3.5 (CDS-View-Entität I_Country / _ZZCountryZem) für 3.6 unten
association[1..1] to I_Country as _ZZCountryZEM 
    on $projection.ZZCountryZEM = _ZZCountryZEM.Country
    
{
   Employee.ZZCountryZEM as ZZCountryZEM,
   Employee.ZZTitleZEM as ZZTitleZEM,
   // Übung 19 Aufgabe 3.3 (Concat...) und 3.4 (ZZFullNameZEM)
   concat_with_space( Employee.FirstName, Employee.LastName, 1 ) as ZZFullNameZEM, 
   // Ü19 Aufgabe 3.6
   _ZZCountryZEM.IsEuropeanUnionMember as ZZEUBasedZEM
}
