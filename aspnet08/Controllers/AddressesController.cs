using Microsoft.AspNetCore.Mvc;
using aspnet08.Data;
using aspnet08.Models;
using Microsoft.EntityFrameworkCore;

namespace aspnet08.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AddressesController(ApplicationDbContext context) : ControllerBase
    {
        private readonly ApplicationDbContext _context = context;

        [HttpGet]
        public async Task<IActionResult> GetAll() =>
            Ok(await _context.Addresses.ToListAsync());

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            var address = await _context.Addresses.FindAsync(id);
            return address == null ? NotFound() : Ok(address);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Address address)
        {
            _context.Addresses.Add(address);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(Get), new { id = address.Id }, address);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Address address)
        {
            if (id != address.Id) return BadRequest();
            _context.Entry(address).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var address = await _context.Addresses.FindAsync(id);
            if (address == null) return NotFound();
            _context.Addresses.Remove(address);
            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpPost("reset")]
        public async Task<IActionResult> ResetAddresses()
        {
            await _context.Database.ExecuteSqlRawAsync("CALL reset_database();");
            return Ok(new { message = "Base de données réinitialisée." });
        }
    }
}