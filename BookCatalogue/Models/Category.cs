using System;
using System.Collections.Generic;

namespace BookCatalogue.Models
{
    public partial class Category
    {
        public Category()
        {
            Book = new HashSet<Book>();
        }

        public int CategoryId { get; set; }
        public int? Type { get; set; }
        public string Description { get; set; }

        public virtual CategoryType TypeNavigation { get; set; }
        public virtual ICollection<Book> Book { get; set; }
    }
}
