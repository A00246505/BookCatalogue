using System;
using System.Collections.Generic;

namespace BookCatalogue.Models
{
    public partial class Book
    {
        public int Id { get; set; }
        public int? CategoryId { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string Isbn { get; set; }

        public virtual Category Category { get; set; }
    }
}
