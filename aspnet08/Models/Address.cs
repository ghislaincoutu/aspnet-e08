namespace aspnet08.Models;

using System.ComponentModel.DataAnnotations.Schema;

[Table("addresses")]
public class Address
{
    [Column("id")]
    public int Id { get; set; }

    [Column("cat_id", TypeName = "varchar(3)")]
    public string CatId { get; set; }

    [Column("title", TypeName = "varchar(255)")]
    public string Title { get; set; }

    [Column("url", TypeName = "varchar(255)")]
    public string Url { get; set; }

    [Column("enterprise", TypeName = "varchar(255)")]
    public string Enterprise { get; set; }

    public Address()
    {
        CatId = string.Empty;
        Title = string.Empty;
        Url = string.Empty;
        Enterprise = string.Empty;
    }
}

