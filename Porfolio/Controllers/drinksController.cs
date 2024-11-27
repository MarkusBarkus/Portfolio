using Microsoft.AspNetCore.Mvc;

namespace Porfolio.Controllers
{
    public class drinksController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
