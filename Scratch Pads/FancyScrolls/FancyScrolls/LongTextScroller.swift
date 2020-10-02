//
//  LongTextScroller.swift
//  FancyScrolls
//
//  Created by Carlyn Maw on 9/18/20.
//

import SwiftUI

struct LongTextScroller: View {
    @State var scrollPosition: CGFloat = 0.0
    
    var text = """
    Musa, quibus numeris heroas et arma frequentas,    1
    fabellam permitte mihi detexere paucis.
    nam tibi secessi, tecum penetrale retractans
    consilium; quare neque carmine curro Phalaeco
    nec trimetro iambo nec qui pede fractus eodem    5
    fortiter irasci discit duce Clazomenio.
    cetera quin etiam, quot denique milia lusi
    primaque Romanos docui contendere Graiis
    et salibus variare novis, constanter omitto
    teque quibus princeps et facundissima calles    10
    aggredior: precibus descende clientis et audi.
      Dic mihi, Calliope: quidnam pater ille deorum
    cogitat? an terras et patria saecula mutat
    quasque dedit quondam morientibus eripit artes
    nosque iubet tacitos et iam rationis egenos    15
    non aliter, primo quam cum surreximus aevo,
    glandibus et purae rursus procumbere lymphae?
    an reliquas terras conservat amicus et urbes,
    sed genus Ausonium Romulique exturbat alumnos?
    quid? reputemus enim: duo sunt quibus extulit ingens    20
    Roma caput, virtus belli et sapientia pacis.
    sed virtus, agitata domi et socialibus armis,
    in freta Sicaniae et Carthaginis exilit arces
    ceteraque imperia et totum simul abstulit orbem.
    deinde, velut stadio victor qui solus Achaeo    25
    languet et immota secum virtute fatiscit,
    sic itidem Romana manus, contendere postquam
    destitit et pacem longis frenavit habenis,
    ipsa domi leges et Graia inventa retractans
    omnia bellorum terra quaesita marique    30
    praemia consilio et molli ratione regebat.
    stabat in his, neque enim poterat constare sine istis:
    aut frustra uxori mendaxque Diespiter olim
    'imperium sine fine dedi' dixisse probatur.
    nunc igitur qui rex Romanos imperat inter,    35
    non trabe sed tergo prolapsus et ingluvie albus,
    et studia et sapiens hominum nomenque genusque
    omnia abire foras atque Urbe excedere iussit.
    quid facimus? Graios hominumque relinquimus urbes,
    ut Romana foret magis his instructa magistris:    40
    nunc, Capitolino veluti turbante Camillo
    ensibus et trutina Galli fugere relicta,
    sic nostri palare senes dicuntur et ipsi
    ut ferale suos onus exportare libellos.
    ergo Numantinus Libycusque erravit in isto    45
    Scipio, qui Rhodio crevit formante magistro,
    ceteraque illa manus bello facunda secundo?
    quos inter prisci sententia dia Catonis
    scire deos magni fecisset, utrumne secundis
    an magis adversis staret Romana propago.    50
    scilicet adversis: nam, cum defendier armis
    suadet amor patriae et captiva penatibus uxor,
    convenit, ut vespis, quarum domus arce movente,
    turba rigens strictis per lutea corpora telis;
    ast ubi apes secura redit oblita favorum    55
    plebs patresque una somno moriuntur obeso.
    Romulidarum igitur longa et gravis exitium pax.
      Hoc fabella modo pausam facit. optima, posthac,
    Musa, velim moneas, sine qua mihi nulla voluptas
    vivere, uti quondam †zmyrnalibusque peribat†,    60
    nunc itidem migrare velis. vel denique quidvis
    ut dea quaere aliud: tantum Romana Caleno
    moenia iucundes pariterque averte Sabinos.
    haec ego. tum paucis dea me dignarier infit:
    'pone metus aequos, cultrix mea: summa tyranno    65
    haec instant odia et nostro periturus honore est.
    nam laureta Numae fontisque habitamus eosdem
    et comite Egeria ridemus inania coepta.
    vive, vale. manet hunc pulchrum sua fama dolorem:
    Musarum spondet chorus et Romanus Apollo'.    70
    -- Sulpicia, Caleni uxor, De Statu Rei Publicae [sp.]
    """
    
    var body: some View {
        VStack {
            Slider(value: $scrollPosition)
            ScrollView {
                ScrollViewReader { scrollProxy in
                    Text(text)
                        .id("text")
                        .padding()
                        .onChange(of: scrollPosition) { newScrollPosition in
                            scrollProxy.scrollTo("text", anchor: UnitPoint(x: 0, y: newScrollPosition))
                        }
                }
            }
        }
    }
}


struct LongTextScroller_Previews: PreviewProvider {
    static var previews: some View {
        LongTextScroller()
    }
}
