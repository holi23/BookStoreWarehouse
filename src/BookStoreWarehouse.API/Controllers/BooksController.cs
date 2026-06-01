using Microsoft.AspNetCore.Mvc;

namespace BookStoreWarehouse.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BooksController : ControllerBase
    {
        private readonly ILogger<BooksController> _logger;

        public BooksController(ILogger<BooksController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IActionResult GetAll()
        {
            _logger.LogInformation("Getting all books");
            return Ok(new { message = "API is working" });
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            _logger.LogInformation($"Getting book with id: {id}");
            return Ok(new { id, message = "Book details" });
        }
    }
}
