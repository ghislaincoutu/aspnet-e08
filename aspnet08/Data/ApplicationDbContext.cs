using Microsoft.EntityFrameworkCore;
using aspnet08.Models;

namespace aspnet08.Data
{
    public class ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : DbContext(options)
    {
        public DbSet<Address> Addresses { get; set; }
    }
}
