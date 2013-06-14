using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace Tourism.Models
{
    public class DataManager
    {
        private readonly MuseumsDBEntities3 db;
        private readonly int[] _standartIdList;
        public List<TypeViewModel> types;
        public List<MuseumViewModel> userMuseums;

        public DataManager()
        {
            db = new MuseumsDBEntities3(); 
            // убрать это непотребство!
            _standartIdList = new int[]
                {
                    306, //The State Museum of the History of Religion
                    311, //The State Museum-Reserv "Petergof"
                    313, //The State Museum Monument "Isaakievsky Sobor"
                    314, //The State Russian Museum
                    315, //The State Hermitage
                    317, //The House of Peter I
                    328, //The Memorial Ship Cruiser "Aurora"
                    396, //The Museum-Reserve "Petropavlovskaya krepost"
                    407, //The Museum-Monument "Spas na Krovi"
                };

            types = new List<TypeViewModel>();
            addTypes();
        }

        private void addTypes()
        {
            types.Add(new TypeViewModel {Id = 0, Name = "исторические и историко-бытовые", Checked = false} );
            types.Add(new TypeViewModel {Id = 1, Name = "военные и военно-исторические", Checked = false} );
            types.Add(new TypeViewModel {Id = 2, Name = "естественно-научные и технические", Checked = false} );
            types.Add(new TypeViewModel {Id = 3, Name = "литературные", Checked = false} );
            types.Add(new TypeViewModel {Id = 4, Name = "историко-краеведческий", Checked = false} );
            types.Add(new TypeViewModel {Id = 5, Name = "художественные", Checked = false} );
            types.Add(new TypeViewModel {Id = 6, Name = "выставочные залы", Checked = false} );
            types.Add(new TypeViewModel {Id = 7, Name = "технические", Checked = false} );
            types.Add(new TypeViewModel {Id = 8, Name = "театрально-музыкальные", Checked = false} );
            types.Add(new TypeViewModel {Id = 9, Name ="дворцы-музеи, усадьбы, парки и заповедники", Checked = false} );
            types.Add(new TypeViewModel {Id = 10, Name ="истории промышленных предприятий", Checked = false} );
            types.Add(new TypeViewModel {Id = 11, Name = "истории учебных заведений", Checked = false} );
            types.Add(new TypeViewModel {Id = 12, Name = "этнографические", Checked = false} );
        }

        public ICollection<Museum> GetStandartMuseum()
        {
            var res = new List<Museum>();
            for (var i = 0; i < _standartIdList.Count(); i++)
            {
                res.Add(getMuseumForId(_standartIdList[i]));
            }
            return res;
        }

        private Museum getMuseumForId(int id)
        {
            return db.Museums.SingleOrDefault(it => it.ID == id);
        }

        public List<MuseumViewModel> GetMuseumForTypes(List<string> types)
        {
            List<Museum> res = new List<Museum>();
            foreach (string type in types)
            {
                List<Museum> temp = GetMuseumForType(type);
                foreach (var museum in temp)
                {
                    res.Add(museum);
                }
            }
            return createUserRequest(res);
        }

        public List<MuseumViewModel> createUserRequest(List<Museum> res)
        {
            var userMuseums = new List<MuseumViewModel>();
            for (int i = 0; i < res.Count; i++)
            {
                var temp = new MuseumViewModel
                    {
                        Id = i,
                        Address = res[i].addressRUS,
                        Name = res[i].nameRUS,
                        Checked = false
                    };
                userMuseums.Add(temp);
            }
            return userMuseums;
        }

        private List<Museum> GetMuseumForType(string type)
        {
            var res = (from museum in db.Museums
                       where museum.type == type
                       select museum).ToList();
            return res;
        }

        public List<Museum> Search(string name)
        {
            name = name.ToLower();
            string[] keys = name.Split(' ');

            var allMuseums = (from museum in db.Museums select museum).ToArray();
            
            var res = new List<Museum>();
            for (int i = 0; i < allMuseums.Length; i++)
            {
                var museumName = allMuseums[i].nameRUS.ToLower();
                var museumDescription = allMuseums[i].description.ToLower();
                bool flag = true;
                foreach (string word in keys)
                {
                    if (flag)
                    {
                        if (word == "музей") continue;
                        flag = museumName.IndexOf(word) >= 0 || museumDescription.IndexOf(word) >= 0;

                    }
                }
                if (flag)
                    res.Add(allMuseums[i]);
            }

            return res;
        }
    }
}