"""
See:
    https://stackoverflow.com/questions/73333720/
"""
import asyncio
import concurrent.futures
import platform


class MissingValue(Exception):
    def __init__(self, value_name: str) -> None:
        super().__init__(f"Missing value: '{value_name}'")


def _do_work() -> None:
    raise MissingValue("val1")


async def _main() -> None:
    with concurrent.futures.ProcessPoolExecutor(max_workers=2) as proc_pool:
        try:
            await asyncio.get_running_loop().run_in_executor(proc_pool, _do_work)
        except Exception as e:
            print(str(e))


if __name__ == "__main__":
    if platform.system() == "Windows":
        asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())

    asyncio.run(_main())
